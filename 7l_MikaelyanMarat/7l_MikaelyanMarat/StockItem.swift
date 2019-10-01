//
//  StockItem.swift
//  7l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 26/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

protocol Sellable {
    var price: Double { get set }
}

class StockItem: Sellable {
    var car: Car
    var price: Double
    
    init(car: Car, price: Double) {
        self.car = car
        self.price = price
    }
}
