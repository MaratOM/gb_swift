import UIKit

print("Решение квадратного уравнения")
print("------------------------------")
func square(a: Double, b: Double, c: Double) {
    let discriminant: Double = b * b - 4 * a * c
    var x1: Double?
    var x2: Double? = 0
    
    if discriminant < 0 {
        print("Уравнение не имеет решений.");
    } else if discriminant == 0.0 {
        x1 = (-b + sqrt(discriminant)) / (2.0 * a)
        
        print("Уравнение имеет одно решение: \(x1!).");
    } else if discriminant > 0 {
        x1 = (-b + sqrt(discriminant)) / (2.0 * a)
        x2 = (-b - sqrt(discriminant)) / (2.0 * a)
        
        print("Уравнение имеет два решения: \(x1!) и \(x2!).");
    }
}

square(a: 1.0, b: 12.0, c: 36.0)
square(a: 5.0, b: 3.0, c: 7.0)
square(a: 4.0, b: 0.0, c: -9.0)

print("==============================")
print("Операции над треугольником")
print("------------------------------")
func triangeOperations( a: Double, b: Double) {
    let c = sqrt(pow(a, 2) + pow(b, 2))
    
    print("Гипотенуза треугольника равна: \(c)")
    print("Периметр треугольника равен: \(a + b + c)")
    print("Площадь треугольника равна: \(a * b / 2)")
}

triangeOperations(a: 3, b: 4)

print("==============================")
print("Расчёт процентов")
print("------------------------------")
func calculateIncome( sum: Int, percent: Int, years: Int) {
    var yearsLeft = 1
    var resultSum = sum

    while yearsLeft <= years {
        resultSum += resultSum / 100 * percent
        yearsLeft += 1
    }
    
    print(resultSum)
}

calculateIncome(sum: 10000, percent: 10, years: 5)
calculateIncome(sum: 100000, percent: 7, years: 5)
