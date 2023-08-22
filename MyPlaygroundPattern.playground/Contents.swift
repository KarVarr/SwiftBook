import Foundation
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


protocol MessageProtocol {
    var text: String? { get set }
    var image: Data? { get set }
    var audio: Data?  { get set }
    
    var video: Data?  { get set }
    
    var sendDate: Date { get set }
    var senderID: UInt { get set }
    
}

struct Message: MessageProtocol {
    var text: String?
    var image: Data?
    var audio: Data?
    var video: Data?
    var sendDate: Date
    var senderID: UInt
}

protocol StatisticDelegate {
    func handle(message: MessageProtocol)
}

protocol MessengerProtocol {
    var messages: [MessageProtocol] { get set }
    var statisticDelegate: StatisticDelegate? { get set }
    init()
    mutating func receive(message: MessageProtocol)
    mutating func send(message: MessageProtocol)
}

struct StatisticManager: StatisticDelegate {
    func handle(message: MessageProtocol) {
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}

struct Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    var statisticDelegate: StatisticDelegate?
    
    init() {
        messages = []
    }
    mutating func receive(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
    }
    mutating func send(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
    }
}

var messenger = Messenger()
messenger.statisticDelegate = StatisticManager()
messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))
