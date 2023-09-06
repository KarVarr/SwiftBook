
import UIKit
import PlaygroundSupport

//protocol SwimBehavior{
//    func swim()
//}
//
//class ProfessionalSwimmer: SwimBehavior {
//    func swim() {
//        print("professional swimmer")
//    }
//}
//
//class NonSwimmer: SwimBehavior {
//    func swim() {
//        print("non swimmer")
//    }
//}
//
//protocol DiveBehavior {
//    func dive()
//}
//
//class ProfessionalDiver: DiveBehavior {
//    func dive() {
//        print("profession diver")
//    }
//}
//
//class NewbieDiver : DiveBehavior {
//    func dive() {
//        print("newbie diver")
//    }
//}
//
//class NonDiving: DiveBehavior {
//    func dive() {
//        print("Non diving")
//    }
//}
//
//
//class Human {
//    var diveBehavior: DiveBehavior!
//    var swimBehavior: SwimBehavior!
//
//    func performSwim() {
//        swimBehavior.swim()
//    }
//
//    func performDive() {
//        diveBehavior.dive()
//    }
//
//    func setSwimBegavior(sb: SwimBehavior) {
//        self.swimBehavior = sb
//    }
//
//    func setDiveBegavior(db: DiveBehavior) {
//        self.diveBehavior = db
//    }
//
//    func run() {
//        print("running")
//    }
//}
//
//let human = Human()
//human.setDiveBegavior(db: NewbieDiver())
//human.performDive()
//
//human.setSwimBegavior(sb: ProfessionalSwimmer())
//human.performSwim()
//


//protocol MessageProtocol {
//    var text: String? { get set }
//    var image: Data? { get set }
//    var audio: Data?  { get set }
//
//    var video: Data?  { get set }
//
//    var sendDate: Date { get set }
//    var senderID: UInt { get set }
//
//}
//
//struct Message: MessageProtocol {
//    var text: String?
//    var image: Data?
//    var audio: Data?
//    var video: Data?
//    var sendDate: Date
//    var senderID: UInt
//}
//
//protocol StatisticDelegate: AnyObject {
//    func handle(message: MessageProtocol)
//}
//
//protocol MessengerProtocol {
//    var messages: [MessageProtocol] { get set }
//    var statisticDelegate: StatisticDelegate? { get set }
//    var dataSource: MessengerDataSourceProtocol? { get set }
//
//    init()
//    mutating func receive(message: MessageProtocol)
//    mutating func send(message: MessageProtocol)
//}
//
//protocol MessengerDataSourceProtocol: AnyObject {
//    func getMessages() -> [MessageProtocol]
//}
//
//class StatisticManager: StatisticDelegate {
//    func handle(message: MessageProtocol) {
//        print("обработка сообщения от User # \(message.senderID) завершена")
//    }
//}
//
//class Messenger: MessengerProtocol {
//    var dataSource: MessengerDataSourceProtocol? {
//        didSet {
//            if let source = dataSource {
//                messages = source.getMessages()
//            }
//        }
//    }
//
//    var messages: [MessageProtocol]
//    weak var statisticDelegate: StatisticDelegate?
//
//    required init() {
//        messages = []
//    }
//    func receive(message: MessageProtocol) {
//        statisticDelegate?.handle(message: message)
//        messages.append(message)
//    }
//    func send(message: MessageProtocol) {
//        statisticDelegate?.handle(message: message)
//        messages.append(message)
//    }
//}
//
//extension Messenger: MessengerDataSourceProtocol {
//    func getMessages() -> [MessageProtocol] {
//         [Message(text: "Как дела?", sendDate: Date(), senderID: 2)]
//    }
//}
//
//
//
//var messenger = Messenger()
//messenger.dataSource = messenger.self
//messenger.getMessages()
//messenger.getMessages()
//messenger.messages.count


//
//print("1")
//DispatchQueue.global(qos:.default).async{
//    print ("2")
//    DispatchQueue.main.sync {
//        print("3")
//    }
//    print ("4")
//}
//print("5")
// 1 2 4 5 3

//
//func cowboy ( weaponInStore: Int, cash: Int, weapons: [Int]) -> Int {
//    guard weaponInStore == weapons.count else { return 0 }
//    guard weapons.min()! < cash else { return 0}
//    return weapons.filter{$0 < cash}.max()!
//}
////
//cowboy(weaponInStore: [34, 6, 300, 15], cash: 13, weapons: 5)

//
//func cowboy (s: String) -> Int {
//    let sheriff = "sheriff"
//    var character = [Character: Int]()
//
//    for char in s {
//        character[char, default: 0] += 1
//    }
//
//    var word = Int.max
//
//    for char in sheriff {
//        if let frequency = character[char] {
//            word = min(word, frequency)
//        } else {
//            return 0
//        }
//    }
//
//    return word
//}
//
//cowboy(s: "fheriherffazfszkisrrs")


//func cowboy(n: Int, arr: [Int], arrForWin: [Int]) -> String {
//    var joe = arr.enumerated().map{ ($0.element, $0.offset) }
//        joe.sort(by: { $0.0 < $1.0 })
//
//        var current = 0
//
//        for (_, index) in joe {
//            if arrForWin[current] == arr[index] {
//                current += 1
//                if current == n {
//                    return "YES"
//                }
//            }
//        }
//        return "NO"
//}
//
//// Read input
//let n = 5
//let joeSequence = [1, 4, 2, 2, 4]
//let winningSequence = [1, 4, 4, 2, 2]
//
//// Check if Joe can obtain the winning sequence
//let result = cowboy(n: n, arr: joeSequence, arrForWin: winningSequence)
//
//// Print the result
//print(result)


//func cowboy() -> Int {
//
//
//    return 0
//}


//
//let backQueue = DispatchQueue.global(qos: .background)
//let mainQueue = DispatchQueue.main
//let serial = DispatchQueue(label: "mainSerial")
//let concurrent = DispatchQueue(label: "concurrent", attributes: .concurrent)
//
//print(" 1 sec")
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    print("hello 3 sec after")
//}
//print("2 sec")

//print("start of file")
//DispatchQueue.global(qos: .background).sync {
//    for i in 0...30 {
//        print("userInteractive \(i)")
//    }
//}
//
//DispatchQueue.global(qos: .background).async {
//    for i in 0...30 {
//        print("background \(i)")
//    }
//}
//print("end of file")

//let thread111 = Thread {
//    print("start hi")
//}
//
//thread111.start()
//print("stop")
//thread111.isMainThread
//thread111.main()
//thread111.isMainThread
//thread111.isFinished
//thread111.cancel()

//DispatchQueue.global()

//let th = Thread {
//    for _ in 0...10 {
//        print("heo")
//    }
//}
//th.qualityOfService = .userInitiated
//th.start()
//print("test or code here")
//th.cancel()
//
//
//
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
//

//func benchmark(_ closure: () -> Void) {
//    let startTime = Date()
//    closure()
//    let endTime = Date()
//
//    let timeElapsed = endTime.timeIntervalSince(startTime)
//    print("Time elapsed: \(timeElapsed) s.")
//}
//
//benchmark {
//    print("start")
//}

func test( word: String, completion: @escaping (String) -> ()) {
    sleep(2)
    print(word)
    sleep(2)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion("Finish escaping")
    }
    
//    for i in word {
//        completion(String(i))
//    }
    sleep(5)
    completion("pipi")
}
//
//test(word: "Hello lox") { lox in
//    print(lox.uppercased())
//    print(lox.map{$0})
//}

test(word: "change pace for completion", completion: { words in
    print("here is new word --> \(words)")
})
