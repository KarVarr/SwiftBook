import Foundation
import UIKit
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







