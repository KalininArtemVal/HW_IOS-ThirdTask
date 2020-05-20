// Этот файл пуст не по ошибке. В этот раз вам необходимо самостоятельно импортировать необходимые модули и запустить проверку
import Foundation
import FirstCourseThirdTaskChecker

/// Вам необходимо создать два сабкласса ArrayInitializableStorage. Один из них должен
/// реализовать стек(LIFO), а второй - очередь(FIFO). Список методов и их требования
/// смотрите в комментариях к классу ArrayInitializableStorage и AbstractStorage.
/// Для проверки передайте экземпляры этих классов в метод. Если ваше решение окажется
/// правильным, то в консоли вы увидите часть кодового слова.
///
/// - Parameters:
///   - stack: Экземпляр сабкласса ArrayInitializableStorage, реализующий стек.
///   - queue: Экземпляр сабкласса ArrayInitializableStorage, реализующий очередь.

var checker = Checker()
//
//______________________________
//class Queue: ArrayInitializableStorage {
//
//    var array: [Int]
//
//    open override var count: Int { get {return array.count} }
//
//
//    required public init(){
//        fatalError("init() has not been implemented")
//    }
//
//    required init(array: [Int]) {
//        fatalError("init(array:) has not been implemented")
//    }
//
//    override func push(_ element: Int) {
//        array.append(element)
//    }
//
//    override func pop() -> Int {
//        var value = 0
//        if array.isEmpty {
//            print("Array is empty")
//        } else if array.count >= 0 {
//            value = array.remove(at: 0)
//        }
//        return value
//    }
//}
//
//class Stack: ArrayInitializableStorage {
//
//    var array = [Int]()
//    required init(array: [Int]) {
//        fatalError("init(array:) has not been implemented")
//    }
//
//    override var count: Int { get {return array.count} }
//    required init() {
//        fatalError("init() has not been implemented")
//    }
//
//    override func pop() -> Int {
//        var value = 0
//        if array.isEmpty {
//            print("Array is empty")
//        } else {
//            value = array.removeLast()
//        }
//        return value
//    }
//
//    override func push(_ element: Int) {
//        array.append(element)
//    }
//}
//
//var queue = Queue()
//var stack = Stack()
//
//var checker = Checker()
//
//checker.checkInheritance(stack: stack, queue: queue)


/// Task 2: - Check Protocols

struct NewStack: StorageProtocol, ArrayInitializable {
    
    var array = [Int]()
    init(array: [Int]) {
        self.array = array
    }
    
    var count: Int { get {return array.count} }
    init() {}
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    
    mutating func pop() -> Int {
        var value = 0
        if array.isEmpty {
            print("Array is empty")
        } else {
            value = array.removeLast()
        }
        return value
    }
}


struct NewQueue: StorageProtocol, ArrayInitializable {
    
    var array = [Int]()
    init(array: [Int]) {
        self.array = array
    }
    
    var count: Int { get {return array.count} }
    init() {}
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    
    mutating func pop() -> Int {
        var value = 0
        if array.isEmpty {
            print("Array is empty")
        } else if array.count >= 0 {
            value = array.remove(at: 0)
        }
        return value
    }
}

let newStack = NewStack()
let newQueue = NewQueue()

checker.checkProtocols(stack: newStack, queue: newQueue)


/// Ваша задача добавить в класс User поддержку протоколов JSONSerializable и JSONInitializable.
/// Требования к ним смотрите в комментариях. Обратите внимание, что проверять данные на
/// корректность не нужно. Checker всегда будет передавать правильный JSON. Для проверки
/// передайте в метод тип User. Если ваше решение окажется правильным, то в консоли вы увидите
/// часть кодового слова. Внимание! Это задание нельзя решать с помощью протокола Codable.
/// Формат и порядок данных в строке нужно соблюсти строго.
///
/// - Parameter userType: Тип User

 /// Конвертирует сущность в JSON вида {"property1": value1, "property2": value2}



extension User: JSONSerializable, JSONInitializable {

    
    public convenience init(JSON: String) {}

    public func toJSON() -> String {
        var json = [String: String]()
        json.updateValue(fullName, forKey: "property1")
        json.updateValue(email, forKey: "property2")
}
}



var aaa = User()
aaa.fullName = "Alex"
aaa.email = "543"

aaa = User(JSON: "Alex")
aaa.toJSON()



checker.checkExtensions(userType: aaa)
