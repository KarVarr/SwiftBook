import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//class SafeArray<Element> {
//    private var array = [Element]()
//    private let queue = DispatchQueue(label: "DispatchBarrier", attributes: .concurrent)
//
//    public func append(element: Element) {
//        queue.async(flags: .barrier) {
//            self.array.append(element)
//        }
//    }
//
//    public var elements: [Element] {
//        var result = [Element]()
//        queue.sync {
//            result = self.array
//        }
//
//        return result
//    }
//}
//
//var safeArray = SafeArray<Int>()
//DispatchQueue.concurrentPerform(iterations: 10) { (index) in
//    safeArray.append(element: index)
//}
//print("safeArray: \(safeArray.elements)")
//
//var array = [Int]()
//DispatchQueue.concurrentPerform(iterations: 10) { (index) in
//    array.append(index)
//}
//print("array: \(array)")


//MARK: - DispatchGroup
//
//let queue = DispatchQueue(label: "ru.swiftbook", attributes: .concurrent)
//let group = DispatchGroup()
//
//queue.async(group: group) {
//    for i in 0...10 {
//        if i == 10 {
//            print(i)
//        }
//    }
//}
//
//queue.async(group: group) {
//    for i in 0...20 {
//        if i == 20 {
//            print(i)
//        }
//    }
//}
//
//group.notify(queue: .main) {
//    print("All it's done!")
//}
//
//let secondGroup = DispatchGroup()
//secondGroup.enter()
//queue.async(group: group) {
//    for i in 0...30 {
//        if i == 30 {
//            print(i)
//            sleep(2)
//            secondGroup.leave()
//        }
//    }
//}
//
//let result = secondGroup.wait(timeout: .now() + 1)
//print(result)
//
//secondGroup.notify(queue: .main) {
//    print("It's all over in the group: secondGroup")
//
//}
//
//print("this print might be upper then last one1 ")
        
//MARK: - DispatchGroupItem

let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
    print("Perform workitem")
}

//workItem.perform()
let queue = DispatchQueue(label: "ru.swiftbook", attributes: .concurrent ,target: DispatchQueue.global(qos: .userInitiated))

queue.asyncAfter(deadline: .now() + 1, execute: workItem)

workItem.notify(queue: .main) {
    print("workitem is complete ")
}

workItem.isCancelled
workItem.cancel()
workItem.isCancelled
