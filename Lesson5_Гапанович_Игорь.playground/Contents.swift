import UIKit

//Урок 5. Динамические структуры данных
//1. Реализовать перевод из десятичной в двоичную систему счисления с использованием стека.

struct Stack {
    private let maxN: Int
    private var curr: Int
    private var data: [Int]
    
    init() {
        self.maxN = 1000
        self.curr = -1
        self.data = [curr]
    }
    
    mutating func push(_ newElement: Int) {
        if data.count < maxN {
            data.append(newElement)
        } else {
            print("Stack overflow")
        }
    }
    
    mutating func pop() -> Int {
        if data.count >= 1 {
            let popElement = data[data.count - 1]
            data.removeLast(1)
            return popElement
        }
        return -1
    }
    
    func description() {
        print("\(data)")
    }
}

func dec2binStack (_ convertingValue: Int) -> Int {
    var number = convertingValue
    var stack = Stack()
    var result: Int = 0
    
    if number == 0 {
        return 0
    } else {
        while number != 0 {
            let newElement = number % 2
            stack.push(newElement)
            number = number / 2
        }
        
        stack.description()
        
        while stack.pop() != -1 {
            stack.description()
            if stack.pop() == -1 {
                print("Stack is empty")
            } else {
                result = result * 10 + stack.pop()
            }
            print(stack.pop())
        }
        
        return result
    }
}

print(dec2binStack(1))
print(dec2binStack(2))
print(dec2binStack(10))
print(dec2binStack(111))
print(dec2binStack(523412))


//2. Добавить в программу «реализация стека на основе односвязного списка» проверку на выделение памяти. Если память не выделяется, то выводится соответствующее сообщение. Постарайтесь создать ситуацию, когда память не будет выделяться (добавлением большого количества данных).



//3. Написать программу, которая определяет, является ли введенная скобочная последовательность правильной. Примеры правильных скобочных выражений: (), ([])(), {}(), ([{}]), неправильных — )(, ())({), (, ])}), ([(]) для скобок [,(,{.
//Например: (2+(2*2)) или [2/{5*(4+7)}]


//4. *Создать функцию, копирующую односвязный список (то есть создает в памяти копию односвязного списка, не удаляя первый список).



//5. **Реализовать алгоритм перевода из инфиксной записи арифметического выражения в постфиксную.



//6. *Реализовать очередь.
