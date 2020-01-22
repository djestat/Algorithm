import UIKit

//1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.

func generateArray (countElements: Int) -> [Int] {
    var array: [Int] = [Int]()
    for _ in 1...countElements {
        array.append(Int.random(in: 0...countElements*10))
    }
    return array
}

let array1: [Int] = generateArray(countElements: 10)
let array2: [Int] = generateArray(countElements: 22)
let array3: [Int] = generateArray(countElements: 28)

func bubleSorting(arrayForSorting: [Int]) -> [Int] {
    var array = arrayForSorting
    var count = 0
    var swapCount = 0
    
    for _ in 0..<array.count {
        for j in 1..<array.count {
            if array[j] < array[j-1] {
                array.swapAt(j-1, j)
                swapCount += 1
            }
            count += 1
        }
    }
    print("Count of operation: \(count)")
    print("Swap count of operation: \(swapCount)")
    return array
}

func bubleSortingOptimized(arrayForSorting: [Int]) -> [Int] {
    var array = arrayForSorting
    var count = 0
    var swapCount = 0
    
    for i in 0..<array.count {
        for j in 1..<array.count - i {
            if array[j] < array[j-1] {
                array.swapAt(j-1, j)
                swapCount += 1
            }
            count += 1
        }
    }
    print("Count of operation: \(count)")
    print("Swap count of operation: \(swapCount)")
    return array
}

print("Array before sorting: \(array1)\n")
print("Array after buble sorting: \(bubleSorting(arrayForSorting: array1))\n")
print("Array after optimized buble sorting: \(bubleSortingOptimized(arrayForSorting: array1))\n")

print("Array before sorting: \(array2)\n")
print("Array after buble sorting: \(bubleSorting(arrayForSorting: array2))\n")
print("Array after optimized buble sorting: \(bubleSortingOptimized(arrayForSorting: array2))\n")

print("Array before sorting: \(array3)\n")
print("Array after buble sorting: \(bubleSorting(arrayForSorting: array3))\n")
print("Array after optimized buble sorting: \(bubleSortingOptimized(arrayForSorting: array3))\n")


//2. *Реализовать шейкерную сортировку.

func shakerSorting(arrayForSorting: [Int]) -> [Int] {
    var array = arrayForSorting
    var leftCount = 0
    var rightCount = 0
    var swapCount = 0
    
    for i in 0..<array.count {
        if i % 2 == 0 {
            for j in 1..<array.count {
                if array[j] < array[j-1] {
                    array.swapAt(j-1, j)
                    swapCount += 1
                }
                leftCount += 1
            }
        } else {
            for j in (1..<array.count).reversed() {
                if array[j] < array[j-1] {
                    array.swapAt(j-1, j)
                    swapCount += 1
                }
                rightCount += 1
            }
        }
    }
    print("Count of operation: \(leftCount+rightCount) = Left \(leftCount) + Right \(rightCount)")
    print("Swap count of operation: \(swapCount)")
    return array
}

print("Array after shaker sorting: \(shakerSorting(arrayForSorting: array1))\n")

print("Array after shaker sorting: \(shakerSorting(arrayForSorting: array2))\n")

print("Array after shaker sorting: \(shakerSorting(arrayForSorting: array3))\n")


//3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.

func binarySearch(array: [Int], searchigValue: Int) -> Int {
    var index = -1
    
    var left = 0
    var right = array.count - 1
    var middle: Int = left + (right - left) / 2

    while left <= right && array[middle] != searchigValue {

        if array[middle] < searchigValue {
            left = middle + 1
        } else if array[middle] > searchigValue {
            right = middle - 1
        }
        middle = left + (right - left) / 2
    }
    
    if middle == searchigValue {
        index = middle
    }

    return index
}

print("Index searchig value: \(binarySearch(array: [1,2,3,6,8,11,54,68,457], searchigValue: 3))\n")
print("Index searchig value: \(binarySearch(array: [0,1,2,3,4,5,6,7], searchigValue: 6))\n")
print("Index searchig value: \(binarySearch(array: bubleSorting(arrayForSorting: array1), searchigValue: 25))\n")
print("Index searchig value: \(binarySearch(array: bubleSorting(arrayForSorting: array2), searchigValue: 25))\n")
print("Index searchig value: \(binarySearch(array: bubleSorting(arrayForSorting: array3), searchigValue: 25))\n")

//4. *Подсчитать количество операций для каждой из сортировок и сравнить его с асимптотической сложностью алгоритма.



