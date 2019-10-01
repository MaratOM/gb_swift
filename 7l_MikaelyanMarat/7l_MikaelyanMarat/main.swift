//
//  main.swift
//  7l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 23/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

var cars = Stock<StockItem>()

var mazda = StockItem(car: SportCar(model: "Mazda MX-5", year: 2017), price: 40000.00)
var porsche = StockItem(car: SportCar(model: "Porsche 911", year: 2018), price: 50000.00)
var apline = StockItem(car: SportCar(model: "Alpine A110", year: 2018), price: 45000.00)
var mclaren = StockItem(car: SportCar(model: "McLaren 570S", year: 2019), price: 620000.00)
var chevrolet = StockItem(car: TrunkCar(model: "Chevrolet LUV", year: 2017, bodyVolume: 4500.00), price: 54000.00)
var toyota = StockItem(car: TrunkCar(model: "Toyota Truck Xtracab SR5", year: 2016, bodyVolume: 7000.00), price: 38000.00)
var dodge = StockItem(car: TrunkCar(model: "Dodge Ram", year: 2017, bodyVolume: 9000.00), price: 420000.00)

cars.addToStock(car: mazda)
cars.addToStock(car: porsche)
cars.addToStock(car: apline)
cars.addToStock(car: mclaren)
cars.addToStock(car: chevrolet)
cars.addToStock(car: toyota)
cars.addToStock(car: dodge)

do {
    let car = try cars.sell(car: mazda, funds: 40000.00)
    print("-- Selling: Car \(String(describing: car?.model)) sold.")
} catch let error {
    print(error)
}

do {
    let car = try cars.sell(car: mazda, funds: 40000.00)
    print("-- Selling: Car \(String(describing: car?.model)) sold.")
} catch let error {
    print("-- Selling error: \(error)")
}

do {
    let car = try cars.sell(car: toyota, funds: 20000.00)
    print("-- Selling: Car \(String(describing: car?.model)) sold.")
} catch let error {
    print("-- Selling error: \(error)")
}

print("-- Number of cars in Stock: \(cars.carsQuantity)")
print("-- Cars of 2018 year of release: \(cars.carsByYear(year: 2018))")
print("-- Cars by names: \(cars.carsModels())")

do {
    let car = try cars.sell(car: cars[3]!, funds: 54000.00)
    print("-- Selling: Car \(String(describing: car?.model)) sold.")
} catch let error {
    print("-- Selling error: \(error)")
}

print("-- Number of cars in Stock: \(cars.carsQuantity)")

