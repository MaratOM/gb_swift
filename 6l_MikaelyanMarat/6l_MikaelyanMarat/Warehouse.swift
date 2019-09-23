//
//  Warehouse.swift
//  6l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 23/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

struct Warehouse<T:Car> {
    var cars: [Car] = []
    var carsQuantity: Int {
        return cars.count
    }
    
    mutating func addToWarehouse(car: T) {
        cars.append(car)
    }
    
    mutating func sell(car: T?) {
        cars = cars.filter{$0.model != car?.model}
    }
    
    func carsByYear(year: Int) -> [Car] {
        return cars.filter{$0.year == year}
    }
    
    func carsModels() -> [String] {
        return cars.map{$0.model}
    }
    
    subscript(element: Int) -> Car? {
        if (element < cars.count) {
            return cars[element]
        } else {
            return nil
        }
    }
}
