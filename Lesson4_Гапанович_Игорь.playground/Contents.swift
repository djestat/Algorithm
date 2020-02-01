import UIKit

//1. Количество маршрутов с препятствиями. Реализовать чтение массива с препятствием и нахождение количество маршрутов.
//Например, карта:
//3 3
//1 1 1
//0 1 0
//0 1 1

//W(a,b) = W(a - 1, b) + W(a, b - 1), если Map[a][b] = 1, W(a,b) = 0, если Map[a][b] = 0

struct Map {
    let rows: Int
    let columns: Int
    var value: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.value = Array(repeating: 1, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return value[row * columns + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return value[row * columns + column] = newValue
        }
    }
}

func printMap(map: Map) {
    for i in 0..<map.rows {
        for j in 0..<map.columns {
            print(map[i,j], separator: "", terminator: "  ")
        }
        print("\n")
    }
}

func routesCalculation(map: Map) -> Map {
    var newMap = map
    for j in 0..<map.columns {
        if map[0,j] != 0 {
            if j+1 <= map.columns {
                newMap[0,j] = 1
            }
            if j > 1 {
                if map[0,j-1] == 0 {
                    newMap[0,j] = 0
                }
            }
        }
    }
    
    for i in 1..<map.rows {
        if newMap[i,0] != 0 {
            if i != 0 {
                if newMap[i-1,0] != 0 {
                    newMap[i,0] = 1
                } else {
                    newMap[i,0] = 0
                }
            }
        }
        
        for j in 1..<map.columns {
            if map[i,j] != 0 {
                newMap[i,j] = newMap[i,j-1] + newMap[i-1,j]
            }
        }
        
    }
    
    return newMap
}

let mapSize = 5

var map = Map(rows: mapSize, columns: mapSize)

map[1,0] = 0
map[1,2] = 0
map[2,0] = 0
map[2,0] = 0
//map[3,2] = 0
//map[3,3] = 0

map[0,3] = 0

print("Before")
printMap(map: map)

print("After")
map = routesCalculation(map: map)
printMap(map: map)



//2. *Решить задачу о нахождении длины максимальной последовательности с помощью матрицы.


//3. ***Требуется обойти конем шахматную доску размером NxM, пройдя через все поля доски по одному разу. Здесь алгоритм решения такой же, как в задаче о 8 ферзях. Разница только в проверке положения коня.


