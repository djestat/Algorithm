import UIKit

//Урок 6. Деревья
//1. Реализовать простейшую хеш-функцию. На вход функции подается строка, на выходе сумма кодов символов.

let hexDigits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

func hashSum(_ string: String) -> String {
    var hash: String = ""
    let multiplier = 1289235
    var result = 0
    
    let arrayOfCharCodeInString = string.unicodeScalars.map { $0.value }
    print(arrayOfCharCodeInString)
    
    for i in 0..<arrayOfCharCodeInString.count {
        result = result + Int(arrayOfCharCodeInString[i]) * multiplier
    }
    
    while result > 0 {
        let index = result % 16
        hash.insert(hexDigits[index], at: hash.startIndex)
        result /= 16
    }
    
    return hash
}

print(hashSum("A"))
print(hashSum("a"))
print(hashSum("2235235"))
print(hashSum("$%%@!*()"))
print(hashSum("Doom"))
print(hashSum("DooM"))
print(hashSum("DOOM"))
print(hashSum("Jango"))
print(hashSum("JANGO"))


//2. Переписать программу, реализующую двоичное дерево поиска.

class BinaryTree {
    var value: Int?
    var left: BinaryTree?
    var right: BinaryTree?
    
    init() {
        self.value = nil
        self.left = nil
        self.right = nil
    }
    
    init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func leftChild(_ left: BinaryTree) {
        self.left = left
    }
    
    func rightChild(_ right: BinaryTree) {
        self.right = right
    }
}

func createTree(_ n: Int) -> BinaryTree {
    let tree = BinaryTree()
    var x: Int
    var nl: Int
    var nr: Int

    if n <= 0 {
//        print("Can not create Tree")
    } else {
        x = Int.random(in: 1...1000)
        nl = n / 2
        nr = n - nl - 1
        tree.value = x
        tree.leftChild(createTree(nl))
        tree.rightChild(createTree(nr))
    }
    return tree
}

let newTree = createTree(23)

//а) Добавить в него обход дерева различными способами;

func directBypassBinaryTree(_ rootBinaryTree: BinaryTree) {
    if rootBinaryTree.value != nil {
        print("\(rootBinaryTree.value!)", separator: "", terminator: "")
        if rootBinaryTree.left != nil || rootBinaryTree.right != nil {
            print("(", separator: "", terminator: "")
            directBypassBinaryTree(rootBinaryTree.left!)
            print(",", separator: "", terminator: "")
            directBypassBinaryTree(rootBinaryTree.right!)
            print(")", separator: "", terminator: "")
        }
    } else {
        print("NULL", separator: "", terminator: "")
    }
}

directBypassBinaryTree(newTree)


//б) Реализовать поиск в двоичном дереве поиска;





//3. *Разработать базу данных студентов из полей «Имя», «Возраст», «Табельный номер», в которой использовать все знания, полученные на уроках.
//Считайте данные в двоичное дерево поиска. Реализуйте поиск по какому-нибудь полю базы данных (возраст, вес).
