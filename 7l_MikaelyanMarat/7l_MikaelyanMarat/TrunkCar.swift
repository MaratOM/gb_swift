//
//  TrunkCar.swift
//  6l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 23/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

class TrunkCar: Car {
    enum BodyFillingActions: CustomStringConvertible {
        case load(volume: Double)
        case unload(volume: Double)
        
        var description: String {
            switch self {
            case .load(let volume):
                return "\(volume) kg to be loaded"
            case .unload(let volume):
                return "\(volume) kg to be unloaded"
            }
        }
    }
    var model: String
    var year: Int
    var engineStatus: EngineStatus = .off
    var windowsStatus: WindowsStatus = .closed
    var bodyVolume: Double
    var bodyFilledVolume: Double = 0 {
        didSet {
            print("The body is \(self.bodyFilledPercent()) % full, \(bodyVolume - bodyFilledVolume) kg more can be loaded")
        }
    }
    
    init(model: String, year: Int, bodyVolume: Double) {
        self.model = model
        self.year = year
        self.bodyVolume = bodyVolume
    }
    
    func buy() {
        print("You bought \(self.description)")
    }
    
    func hanldeBodyLoading(action: BodyFillingActions) {
        switch action {
        case .load(let volume) where self.bodyFilledVolume + volume >= bodyVolume:
            print("Not enough room for loading \(volume) kg!")
        case .load(let volume):
            bodyFilledVolume += volume
        case .unload where self.bodyFilledVolume == 0:
            print("Body is empty, nothing to unloed!")
        case .unload(let volume):
            bodyFilledVolume -= volume <= bodyFilledVolume ? volume : bodyFilledVolume
        }
    }
    
    func bodyFilledPercent () -> Double {
        return bodyFilledVolume * 100 / bodyVolume
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Trunk Car of \(model) model \(year) year of release.\nEngine status: \(engineStatus).\nWindows status: \(windowsStatus).\nTrunk is loaded for \(bodyFilledVolume) kg."
    }
}
