//
//  SportCar.swift
//  7l_MikaelyanMarat
//
//  Created by Marat Mikaelyan on 23/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import Foundation

class SportCar: Car {
    enum TurboModeStatus: CustomStringConvertible {
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Turbo mode on"
            case .off:
                return "Turbo mode off"
            }
        }
    }
    var model: String
    var year: Int
    var engineStatus: EngineStatus = .off
    var windowsStatus: WindowsStatus = .closed
    var turboModeStatus: TurboModeStatus = .off
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    func buy() {
        print("You bought \(self.description)")
    }
    
    func handleTurboMode (status: TurboModeStatus) {
        self.turboModeStatus = status
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Sport Car of '\(model)' model \(year) year of release.\nEngine status: \(engineStatus).\nWindows status: \(windowsStatus).\nTurbo mode status: \(turboModeStatus)."
    }
}
