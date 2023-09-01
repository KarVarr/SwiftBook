//
//  ViewController.swift
//  MyCars
//
//  Created by Ivan Akulov on 08/02/20.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    var car: Car!
    
    
    lazy var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .none
        return df
    }()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl! {
        didSet {
            updateSegmentedControl()
            let white = [NSAttributedString.Key.foregroundColor: UIColor.white]
            let orange = [NSAttributedString.Key.foregroundColor: UIColor.orange]
            
            UISegmentedControl.appearance().setTitleTextAttributes(white, for: .normal)
            UISegmentedControl.appearance().setTitleTextAttributes(orange, for: .selected)
        }
    }
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var lastTimeStartedLabel: UILabel!
    @IBOutlet weak var numberOfTripsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var myChoiceImageView: UIImageView!
    
    @IBAction func segmentedCtrlPressed(_ sender: UISegmentedControl) {
        updateSegmentedControl()
    }
    
    @IBAction func startEnginePressed(_ sender: UIButton) {
        car.timesDriven += 1
        car.lastStarted = Date()
        
        do {
            try context.save()
            insertDataFrom(selectedCar: car)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func rateItPressed(_ sender: UIButton) {
        let ac = UIAlertController(title: "Rate it", message: "Rate this car", preferredStyle: .alert)
        let rateAction = UIAlertAction(title: "Rate", style: .default) { [unowned self] _ in
            if let text = ac.textFields?.first?.text {
                self.update(rating: (text as NSString).doubleValue)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addTextField { textField in
            textField.keyboardType = .numberPad
            textField.placeholder = "Enter some number"
        }
        
        ac.addAction(rateAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
    }
    
    private func updateSegmentedControl() {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let mark = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        fetchRequest.predicate = NSPredicate(format: "mark == %@", mark!)
        
        do {
            let result =  try context.fetch(fetchRequest)
            car = result.first
            insertDataFrom(selectedCar: car!)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func update(rating: Double) {
        car.rating = rating
        
        
        do {
            try context.save()
            insertDataFrom(selectedCar: car)
        } catch {
            let ac = UIAlertController(title: "Wrong value", message: "Wrong input value", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
            print(error.localizedDescription)
        }
    }

    
    private func insertDataFrom(selectedCar car: Car) {
        carImageView.image = UIImage(data: car.imageData!)
        markLabel.text = car.mark
        modelLabel.text = car.model
        myChoiceImageView.isHidden = !car.myChoice
        ratingLabel.text = "Rating \(car.rating) / 10"
        numberOfTripsLabel.text = "Number of trips: \(car.timesDriven)"
        lastTimeStartedLabel.text = "Last time started: \(dateFormatter.string(from: car.lastStarted!   ))"
        segmentedControl.backgroundColor = car.tintColor as? UIColor
    }
    
    private func getDataFromFile() {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "mark != nil")
        
        var records = 0
        
        do {
            records = try context.count(for: fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        
        guard records == 0 else { return }
        
        guard let pathToFile = Bundle.main.path(forResource: "data", ofType: "plist"),
              let dataArray = NSArray(contentsOfFile: pathToFile) else { return }
        
        for dictionary in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)
            let car = NSManagedObject(entity: entity!, insertInto: context) as! Car
            
            let carDictionary = dictionary as! [String: AnyObject]
            car.mark = carDictionary["mark"] as? String
            car.model = carDictionary["model"] as? String
            car.rating = carDictionary["rating"] as! Double
            car.myChoice = carDictionary["myChoice"] as! Bool
            car.lastStarted = carDictionary["lastStarted"] as? Date
            car.timesDriven = carDictionary["timesDriven"] as! Int16
            
            let imageName = carDictionary["imageName"] as? String
            let image = UIImage(named: imageName!)
            let imageData = image?.pngData()
            car.imageData = imageData
            
            if let colorDictionary = carDictionary["tintColor"] as? [String: Float] {
                car.tintColor = getColor(colorDictionary: colorDictionary)
            }
        }
    }
    
    private func getColor(colorDictionary: [String: Float]) -> UIColor {
        guard let red = colorDictionary["red"],
              let green = colorDictionary["green"],
              let blue = colorDictionary["blue"] else {return UIColor()}
        
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1.0)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let userDefaults = UserDefaults.standard
        //        let launched = userDefaults.bool(forKey: "launched")
        
        //это будет первый запуск приложения
        //        if !launched {
        //            getDataFromFile()
        //            userDefaults.set(true, forKey: "launched")
        //        } else { // это второй уже запуск будет
        //
        //        }
        
        getDataFromFile()
        
        
        
    }
    
}

