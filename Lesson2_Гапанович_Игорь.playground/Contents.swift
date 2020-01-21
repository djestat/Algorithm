import UIKit

//1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.

func dec2binRecursion(_ number: Int) -> Int {
    if number == 0 {
        return 0
    } else {
        return (number % 2 + 10 * dec2binRecursion(number / 2))
    }
}

print(dec2binRecursion(1))
print(dec2binRecursion(2))
print(dec2binRecursion(10))
print(dec2binRecursion(111))
print(dec2binRecursion(523412))

//2. Реализовать функцию возведения числа a в степень b:
//a. без рекурсии;

func exponentiationWithoutRecursion(a:Int, b:Int) -> Int{
    var result: Int = 1
    var c = 0
    
    if a > 0 && b > 0 {
        while c != b {
            result = result * a
            c += 1
        }
    } else {
        result = 0
    }

    return result
}

print(exponentiationWithoutRecursion(a: 0, b: 0))
print(exponentiationWithoutRecursion(a: 2, b: 2))
print(exponentiationWithoutRecursion(a: 3, b: 2))
print(exponentiationWithoutRecursion(a: 3, b: 3))
print(exponentiationWithoutRecursion(a: 4, b: 2))


//b. рекурсивно;

func exponentiationWithRecursion(a:Int, b:Int) -> Int{
    var result: Int = a
    
    if b > 1 {
        result = result * exponentiationWithRecursion(a: a, b: b - 1)
    }
    
    return result
}

print(exponentiationWithRecursion(a: 0, b: 0))
print(exponentiationWithRecursion(a: 2, b: 2))
print(exponentiationWithRecursion(a: 3, b: 2))
print(exponentiationWithRecursion(a: 3, b: 3))
print(exponentiationWithRecursion(a: 4, b: 2))

//c. *рекурсивно, используя свойство четности степени.



//3.* Исполнитель Калькулятор преобразует целое число, записанное на экране. У исполнителя две команды, каждой команде присвоен номер:

//Прибавь 1
//Умножь на 2
//Первая команда увеличивает число на экране на 1, вторая увеличивает это число в 2 раза. Сколько существует программ, которые число 3 преобразуют в число 20?
//а) с использованием массива;
//б) с использованием рекурсии.
