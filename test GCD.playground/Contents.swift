//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


//class MyViewController : UIViewController {
//    let button = UIButton(type: .system)
//    override func loadView() {
//        super.loadView()
//        let view = UIView()
//
//
//        view.backgroundColor = .lightGray
//        self.view = view
//        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        initButton()
//    }
//
//
//    @objc func pressAction() {
//        let vc = TwoViewController()
//        navigationController?.pushViewController(vc, animated: true)
//
//    }
//    func initButton() {
//        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        button.setTitle("Press", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.center = view.center
//        button.backgroundColor = .orange
//        button.layer.cornerRadius = 25
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        view.addSubview(button)
//    }
//}
//
//let vc = MyViewController()
//let navbar = UINavigationController(rootViewController: vc)
//vc.title = "VC 1"
//
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
//
//class TwoViewController : UIViewController {
//
//        override func loadView() {
//        super.loadView()
//        let view = UIView()
//
//        view.backgroundColor = .cyan
//        self.view = view
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
//}
//
//let vc2 = TwoViewController()
//vc2.title = "VC 2"


//var str = "Work item"
//
////var imageURL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
//
//class DispatchWorkItem1 {
//    var count = 0
//    private let queue = DispatchQueue(label: "DispatchWorkItem1", attributes: .concurrent)
//
//    func create() {
//        let workItem = DispatchWorkItem {
//            print(Thread.current)
//            print("start task")
//        }
//
//        workItem.notify(queue: .main) {
//            print(Thread.current)
//            print("end task")
//        }
//
//        queue.async { [unowned self] in
//            self.count += 1
//        }
//
//        queue.async { [unowned self] in
//            self.count += 1
//        }
//        queue.async { [unowned self] in
//            self.count += 1
//        }
//
//        if count < 3 {
//            workItem.cancel()
//            print("workitem canceled")
//            print(Thread.current)
//        }
//
//
//        queue.async(execute: workItem)
//    }
//}
//
//let dispatchWorkItem1 = DispatchWorkItem1()
//dispatchWorkItem1.create()

//
//let serialQueue = DispatchQueue(label: "ru.denisegaluev.serial-queue")
//
//// Создаем семафор
//let semaphore = DispatchSemaphore(value: 0)
//
//// Усыпляем serialQueue на 5 секунд, после вызываем метод signal тем самым
//serialQueue.async {
//    sleep(5)
//
//    // Разблокировавыем семафор
//    semaphore.signal()
//}
//
//// Блокируем очередь
//semaphore.wait()
//

//// Создаем очередь
//let serialQueue = DispatchQueue(label: "ru.denisegaluev.serial-queue")
//
//// Создаем 2 DispatchWorkItem
//let workItem1 = DispatchWorkItem {
//    print("workItem1: zzzZZZ")
//    sleep(3)
//    print("workItem1: awaked")
//}
//
//let workItem2 = DispatchWorkItem {
//    print("workItem2: zzzZZZ")
//    sleep(3)
//    print("workItem2: awaked")
//}
//
//// Создаем группу
//let group = DispatchGroup()
//
//// Добавляем workItem в группе, планируем его выполнение на очереди serialQueue и сразу возвращаем управление
//serialQueue.async(group: group, execute: workItem1)
//serialQueue.async(group: group, execute: workItem2)
//
//// Устанавливаем уведомление. Замыкание будет выполнено на главной очереди сразу после того, как все задачи в группе будут выполнены.
//group.notify(queue: DispatchQueue.main) {
//    print("All tasks on group completed")
//}

//
//let queue = DispatchQueue (label: "The Swift Developer", attributes: .concurrent)
//
//let semaphore = DispatchSemaphore(value: 1)
//queue.async {
//    semaphore.wait () //-1
//    sleep(3)
//    print ("method 1")
//    semaphore.signal()
//}
//
//queue.async {
//    semaphore.wait () //-1
//    sleep(3)
//    print ("method 2")
//    semaphore.signal()
//}
//
//queue.async {
//    semaphore.wait () //-1
//    sleep(3)
//    print ("method 3")
//    semaphore.signal()
//}
//
//queue.async {
//    sleep(3)
//    print ("method NO 1")
//
//}
//
//queue.async {
//
//    sleep(3)
//    print ("method NO 2")
//
//}
//
//queue.async {
//
//    sleep(3)
//    print ("method NO 3")
//
//}
//
//let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { time in
//    print("Timer fired! \(time)")
//}
//
//func timerAction() {
//        // This method will be called every 1 second
//        print("Timer fired!")
//        
//        // You can perform any action you want here
//    }
