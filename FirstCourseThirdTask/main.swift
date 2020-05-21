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
class Queue: ArrayInitializableStorage {
    
    var newArray = [Int]()
    required init(array: [Int]) {
        super.init(array: newArray)
        self.newArray = array
        self.count = newArray.count
    }
    
    open override var count: Int { get {return newArray.count} set{} }
    
    required public init() {
        super.init()
        self.count = newArray.count
    }
    
    override func push(_ element: Int) {
        newArray.append(element)
    }
    
    override func pop() -> Int {
        var value = 0
        if newArray.isEmpty {
            print("Array is empty")
        } else if newArray.count >= 0 {
            value = newArray.remove(at: 0)
        }
        return value
    }
}

class Stack: ArrayInitializableStorage {
    
    var newArray = [Int]()
    required init(array: [Int]) {
        super.init(array: newArray)
        self.newArray = array
    }
    
    override var count: Int { get {return newArray.count} set {} }
    required init() {
        super.init()
        self.count = newArray.count
    }
    
    override func pop() -> Int {
        var value = 0
        if newArray.isEmpty {
            print("Array is empty")
        } else {
            value = newArray.removeLast()
        }
        return value
    }
    
    override func push(_ element: Int) {
        newArray.append(element)
    }
}
//
var queue = Queue()
var stack = Stack()


checker.checkInheritance(stack: stack, queue: queue)


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
//
//
///// Ваша задача добавить в класс User поддержку протоколов JSONSerializable и JSONInitializable.
///// Требования к ним смотрите в комментариях. Обратите внимание, что проверять данные на
///// корректность не нужно. Checker всегда будет передавать правильный JSON. Для проверки
///// передайте в метод тип User. Если ваше решение окажется правильным, то в консоли вы увидите
///// часть кодового слова. Внимание! Это задание нельзя решать с помощью протокола Codable.
///// Формат и порядок данных в строке нужно соблюсти строго.
/////
///// - Parameter userType: Тип User



extension User: JSONSerializable, JSONInitializable {
    
    
    public func toJSON() -> String {
        let name = fullName
        let em = email
        let string = "{\"fullName\": \"\(name)\", \"email\": \"\(em)\"}"
        return  string
    }

    public convenience init(JSON: String) {
        self.init()
        let data1 = Data(JSON.utf8)
        if let json = try! JSONSerialization.jsonObject(with: data1, options: []) as? [String: String] {
            self.fullName = json["fullName"] ?? ""
            self.email = json["email"] ?? ""
        }
    }
}


let user = User.self
checker.checkExtensions(userType: user)




