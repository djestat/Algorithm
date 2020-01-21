import UIKit

//1. Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах.

func calculateMassIndex(m: Double, h: Double) -> String {
    var i: Double = 0
    var ansver: String = ""

    if m > 250 || h > 2.4 || m < 3 || h < 0.4 {
        ansver = "Введены неверные данные для расчета"
    } else if m > 3 && h > 0.4 {
        i = m / (h * h)
        ansver = "Индекс массы тела \(i)"
    } else {
        ansver = "Ошибка расчета"
    }

    return ansver
}

calculateMassIndex(m: 80, h: 1.75)
calculateMassIndex(m: 60, h: 1.6)
calculateMassIndex(m: -2, h: 0.3)
calculateMassIndex(m: 251, h: 1.3)
calculateMassIndex(m: 151, h: 3.3)


//2. Найти максимальное из четырех чисел. Массивы не использовать.

func findMaxValue(first: Int, second: Int, third: Int, fourth: Int) -> Int {
    var max: Int = 0
    var max1: Int = 0
    var max2: Int = 0
    
    max1 = findMaxValueOfTwo(first: first, second: second)
    max2 = findMaxValueOfTwo(first: third, second: fourth)
    max = findMaxValueOfTwo(first: max1, second: max2)
    
    return max
}

func findMaxValueOfTwo (first: Int, second: Int) -> Int {
    var max: Int = 0

    if first > second {
        max = first
    } else {
        max = second
    }
    
    return max
}

findMaxValue(first: 4545, second: 34, third: 1313, fourth: 33335)
findMaxValue(first: 3, second: 3, third: 3, fourth: 3)
findMaxValue(first: 0, second: 0, third: 3, fourth: 6)
findMaxValue(first: 4, second: 2, third: 1, fourth: 3)


//3. Написать программу обмена значениями двух целочисленных переменных:

//a. с использованием третьей переменной;
//b. *без использования третьей переменной.

func changeValues (a: Int, b: Int) {
    print("Исходные значения: a = \(a) и b = \(b)")
    var a = a
    var b = b
    
    let temp = a
    a = b
    b = temp
    print("Значения после обмена: a = \(a) и b = \(b)")
}

changeValues(a: 2323, b: 1231)
changeValues(a: 235, b: 1231)
changeValues(a: 3, b: 6)

//4. Написать программу нахождения корней заданного квадратного уравнения.

func findD(a: Double, b: Double, c: Double) -> String {
    var ansver: String = ""
    let d = (b * b) - (4 * a * c)
    if d == 0 {
        let x = (-b / (2 * a))
        ansver = "У уравнения один корен \(x)"
    } else if d < 0 {
        ansver = "У уравнения нет действительных корней"
    } else {
        let x1 = (-b - sqrt(d))/(2 * a)
        let x2 = (-b + sqrt(d))/(2 * a)
        ansver = "У уравнения два корня \(x1) и \(x2)"
    }
    return ansver
}

findD(a: 124, b: 124124, c: 21414)
findD(a: 40, b: 2, c: 44)
findD(a: 2, b: 0, c: 1)


//5. С клавиатуры вводится номер месяца. Требуется определить, к какому времени года он относится.

//6. Ввести возраст человека (от 1 до 150 лет) и вывести его вместе с последующим словом «год», «года» или «лет».

//7. С клавиатуры вводятся числовые координаты двух полей шахматной доски (x1,y1,x2,y2). Требуется определить, относятся поля к одному цвету или нет.

//8. Ввести a и b и вывести квадраты и кубы чисел от a до b.

//9. Даны целые положительные числа N и K. Используя только операции сложения и вычитания, найти частное от деления нацело N на K, а также остаток от этого деления.

//10. Дано целое число N (> 0). С помощью операций деления нацело и взятия остатка от деления определить, имеются ли в записи числа N нечетные цифры. Если имеются, то вывести True, если нет — вывести False.

//11. С клавиатуры вводятся числа, пока не будет введен 0. Подсчитать среднее арифметическое всех положительных четных чисел, оканчивающихся на 8.

//12. Написать функцию нахождения максимального из трех чисел.

//13. * Написать функцию, генерирующую случайное число от 1 до 100.
//а) с использованием стандартной функции rand()
//б) без использования стандартной функции rand()

//14. *Автоморфные числа. Натуральное число называется автоморфным, если оно равно последним цифрам своего квадрата. Например, 252 = 625. Напишите программу, которая вводит натуральное число N и выводит на экран все автоморфные числа, не превосходящие N.

//Достаточно решить 3 задачи. Записывайте в начало программы условие и свою фамилию. Все решения создавайте в одной программе. Задачи со звездочками выполняйте в том случае, если решили базовые. Снабдите программу меню.
