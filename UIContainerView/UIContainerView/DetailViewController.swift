//
//  DetailViewController.swift
//  UIContainerView
//
//  Created by Karen Vardanian on 31.12.2022.
//

import UIKit

class DetailViewController: UITableViewController {
    
    let imageNameArray = ["Alberto Ruiz - 7 Elements (Original Mix)",
                              "Dave Wincent - Red Eye (Original Mix)",
                              "E-Spectro - End Station (Original Mix)",
                              "Edna Ann - Phasma (Konstantin Yoodza Remix)",
                              "Ilija Djokovic - Delusion (Original Mix)",
                              "John Baptiste - Mycelium (Original Mix)",
                              "Lane 8 - Fingerprint (Original Mix)",
                              "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
                              "Metodi Hristov, Gallya - Badmash (Original Mix)",
                              "Veerus, Maxie Devine - Nightmare (Original Mix)"]
        

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return imageNameArray.count
     }
     
     
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
      
          cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
          cell.textLabel?.text = imageNameArray[indexPath.row]
          cell.textLabel?.numberOfLines = 0
          
      return cell
      }
      
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 50
     }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//             if segue.identifier == "Title" {
//                 if let indexPath = self.tableView.indexPathForSelectedRow {
//                     let detailsVC = segue.destination as! DetailViewController
//                     detailsVC.trackTitle = imageNameArray[indexPath.row]
//                 }
//             }
//         }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let viewController = parent as? ViewController {
           let trackTitle = imageNameArray[indexPath.row]
           viewController.titleLabel.text = trackTitle
           viewController.imageCover.image = UIImage(named: trackTitle)
        }
    }

}


