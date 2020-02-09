import UIKit

//1. Реализовать сортировку подсчетом.

func simpleCountingSort(​array: [Int], ​​​arrayCount : Int) -> [Int] {
    var ​array = ​array
    var arrayReturn: [Int] = []
    
    for i in 0..<​​​arrayCount {
        arrayReturn[i] = 0
    }
    for i in 0..<​array.count {
        arrayReturn[​array[i]] += 1
    }
    var b: Int = 0
    for j in 0..<​​​arrayCount {
        for _ in 0..<arrayReturn[j] - 1 {
            b += 1
            ​array[b] = j
        }
    }
    return arrayReturn
}

//2. Реализовать быструю сортировку.

func quickSort(numbers: [Int], left: Int, right: Int) -> [Int] {

    var left: Int = left
    var right: Int = right
    var numbers: [Int] = numbers
    
    let lHold: Int = left
    let rHold: Int = right
    var pivot: Int = numbers[left]

    while left < right {
        while numbers[right] >= pivot && left < right {
            right -= 1
        }
        if left != right {
            numbers[left] = numbers[right]
            left += 1
        }
        
        while numbers[left] <= pivot && left < right {
            left += 1
        }
        
        if left != right {
            numbers[right] = numbers[left]
            right -= 1
        }
    }
    numbers[left] = pivot
    pivot = left
    left = lHold
    right = rHold
    
    if left < pivot {
        numbers = quickSort(numbers: numbers, left: left, right: pivot - 1)
    }
    
    if right > pivot {
        numbers = quickSort(numbers: numbers, left: pivot + 1, right: right)
    }
    
    return numbers
}

//3. *Реализовать сортировку слиянием.



//4. Проанализировать время работы каждого из вида сортировок для 100, 10000, 1000000 элементов.
//Если самостоятельно реализовать сортировку не получается, разрешается найти сортировку в Интернете. Желательно прокомментировать строки программы. Записывайте в начало программы условие и свою фамилию. Все решения создавайте в одной программе. Снабдите программу меню.

func timerForSimpleCountingSort (array: [Int]) {
    print(Date.init(timeIntervalSinceNow: 0))
    print(array)
    let resultArray = simpleCountingSort(​array: array, ​​​arrayCount: array.count)
    print(resultArray)
    print(Date.init(timeIntervalSinceNow: 0))
}

func timerForQuickSorting (array: [Int]) {
    print("QuickSorting for \(array.count) elements array")
    let start = Date(timeIntervalSinceNow: 0)
//    print(array)
//    let resultArray =
    quickSort(numbers: array, left: 0, right: array.count - 1)
//    print(resultArray)
    let finish = Date(timeIntervalSinceNow: 0)
    let time = Int(finish.timeIntervalSince1970 - start.timeIntervalSince1970)
    print("Total time: \(time) seconds\n")
}


var arrayForSorting10: [Int] = []
var arrayForSorting100: [Int] = []
var arrayForSorting1000: [Int] = []
var arrayForSorting10000: [Int] = []
var arrayForSorting1000000: [Int] = []

func generateArray(count: Int) -> [Int] {
    var array: [Int] = []
    for _ in 0..<count {
        let int = Int.random(in: 0..<count)
        array.append(int)
    }
    return array
}

arrayForSorting10 = generateArray(count: 10)
arrayForSorting100 = generateArray(count: 100)
arrayForSorting1000 = generateArray(count: 1000)
//arrayForSorting10000 = generateArray(count: 10000)
//arrayForSorting1000000 = generateArray(count: 1000000)


timerForQuickSorting(array: arrayForSorting10)                    // 0 sec
timerForQuickSorting(array: arrayForSorting100)                   // 0 sec
timerForQuickSorting(array: arrayForSorting1000)                  // 5 sec
//timerForQuickSorting(array: arrayForSorting10000)               // 2 min 30 sec
//timerForQuickSorting(array: arrayForSorting1000000)             // Long time

timerForSimpleCountingSort(array: arrayForSorting10)
timerForSimpleCountingSort(array: arrayForSorting100)
timerForSimpleCountingSort(array: arrayForSorting1000)
//timerForSimpleCountingSort(array: arrayForSorting10000)
//timerForSimpleCountingSort(array: arrayForSorting1000000)
