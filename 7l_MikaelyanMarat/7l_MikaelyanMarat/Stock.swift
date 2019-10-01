//
//  Stock.swift
//  7l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 23/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

enum StockErrors: Error {
    case outOfStock
    case insufficientFunds(fundsNeeded: Double)
}

struct Stock<T:StockItem> {
    var cars: [StockItem] = []
    var carsQuantity: Int {
        return cars.count
    }
    
    mutating func addToStock(car: T) {
        cars.append(car)
    }
    
    mutating func sell(car: T, funds: Double) throws -> Car? {
        let carInStock = cars.contains { element in
            if element.car.model == car.car.model {
                return true
            } else {
                return false
            }
        }
        
        guard carInStock else {
            throw StockErrors.outOfStock
        }
        
        guard funds >= car.price else {
            throw StockErrors.insufficientFunds(fundsNeeded: car.price - funds)
        }
        
        cars = cars.filter{$0.car.model != car.car.model}
        
        return car.car
    }
    
    func carsByYear(year: Int) -> [Car] {
        return cars.filter{$0.car.year == year}.map{$0.car}
    }
    
    func carsModels() -> [String] {
        return cars.map{$0.car.model}
    }
    
    subscript(element: Int) -> StockItem? {
        guard element < cars.count else {
            return nil
        }
        
        return cars[element]
    }
}
