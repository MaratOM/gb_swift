//
//  main.swift
//  6l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 23/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

print("===================================")
print("SportCar type warehose")
print("===================================")

var sportCars = Warehouse<SportCar>()

var mazda = SportCar(model: "Mazda MX-5", year: 2017)
var porsche = SportCar(model: "Porsche 911", year: 2018)
var apline = SportCar(model: "Alpine A110", year: 2018)
var mclaren = SportCar(model: "McLaren 570S", year: 2019)

sportCars.addToWarehouse(car: mazda)
sportCars.addToWarehouse(car: porsche)
sportCars.addToWarehouse(car: apline)
sportCars.addToWarehouse(car: mclaren)

sportCars.sell(car: mazda)

print("-- Number of cars in warehouse: \(sportCars.carsQuantity)")
print("-- Cars of 2018 year of release: \(sportCars.carsByYear(year: 2018))")
print("-- Cars by names: \(sportCars.carsModels())")
sportCars.sell(car: sportCars[0] as? SportCar)
sportCars.sell(car: sportCars[10] as? SportCar)
print("-- Number of cars in warehouse: \(sportCars.carsQuantity)")

print("===================================")
print("TrunkCar type warehose")
print("===================================")

var trunkCars = Warehouse<TrunkCar>()

var chevrolet = TrunkCar(model: "Chevrolet LUV", year: 2017, bodyVolume: 5000.00)
var toyota = TrunkCar(model: "Toyota Truck Xtracab SR5", year: 2016, bodyVolume: 7000.00)
var dodge = TrunkCar(model: "Dodge Ram", year: 2017, bodyVolume: 9000.00)

trunkCars.addToWarehouse(car: chevrolet)
trunkCars.addToWarehouse(car: toyota)
trunkCars.addToWarehouse(car: dodge)

trunkCars.sell(car: toyota)

print("-- Number of cars in warehouse: \(trunkCars.carsQuantity)")
print("-- Number of cars of 2017 year of release: \(trunkCars.carsByYear(year: 2017).count)")
print("-- Cars by names: \(trunkCars.carsModels())")
trunkCars.sell(car: trunkCars[1] as? TrunkCar)
trunkCars.sell(car: trunkCars[10] as? TrunkCar)
print("-- Number of cars in warehouse: \(trunkCars.carsQuantity)")
