import UIKit

//1. Написать функцию, которая определяет, делится ли число без остатка на 3
print("1. Написать функцию, которая определяет, делится ли число без остатка на 3")
print("------------------------------")

func isDividedByThree (num: Int) -> Bool {
    return num % 3 == 0 ? true : false
}

print(isDividedByThree(num: 45))
print(isDividedByThree(num: 145))

//2. Создать возрастающий массив из 100 чисел.
print("==============================")
print("2. Создать возрастающий массив из 100 чисел.")
print("------------------------------")

var taskArray: [Int] = []
for i in 0...99 {
    taskArray.append(i)
}

print(taskArray)

//3. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("==============================")
print("3. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")
print("------------------------------")

for (index, value) in taskArray.enumerated().reversed() {
    if (value % 2) == 0 || (value % 3) != 0 {
        taskArray.remove(at: index)
    }
}

print(taskArray)

//4. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
print("==============================")
print("4. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.")
print("------------------------------")

var fArr = [Double]()
func addFNum(fArr: inout Array<Double>) -> () {
    if fArr.isEmpty {
        fArr.append(1)
    } else if (fArr.count == 1) {
        fArr.append(2)
    } else {
        let fArrCount = fArr.count
        let nextNumber = fArr[fArrCount - 1] + fArr[fArrCount - 2]
        fArr.append(nextNumber)
    }
}

for _ in 0...99 {
    addFNum(fArr: &fArr)
}

print(fArr)

//5. Заполнить массив из 100 элементов различными простыми числами.
print("==============================")
print("5. Заполнить массив из 100 элементов различными простыми числами.")
print("------------------------------")
var allNumbers = Array(2...2000)
var primeNumbers = [Int]()
var p = 2

allNumbers.remove(at: allNumbers.firstIndex(of: p)!)
primeNumbers.append(p)

for _ in 0...98 {
    for (index, value) in allNumbers.enumerated().reversed() {
        if value % p == 0 {
            allNumbers.remove(at: index)
        }
    }
    
    p = allNumbers[0]
    allNumbers.remove(at: allNumbers.firstIndex(of: p)!)
    primeNumbers.append(p)
}

print(primeNumbers)
