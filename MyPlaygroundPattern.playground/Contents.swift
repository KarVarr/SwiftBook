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


