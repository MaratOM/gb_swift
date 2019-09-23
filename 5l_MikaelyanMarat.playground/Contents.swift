import UIKit

protocol Car {
    var model: String { get }
    var year: Int { get }
    
    var engineStatus: EngineStatus { get set }
    var windowsStatus: WindowsStatus { get set }
    
    func buy()
}

enum EngineStatus: CustomStringConvertible {
    case on, off
    
    var description: String {
        switch self {
        case .on:
            return "Engine started"
        case .off:
            return "Engine stoped"
        }
    }
}

enum WindowsStatus: CustomStringConvertible {
    case open, closed
    
    var description: String {
        switch self {
        case .open:
            return "Windows open"
        case .closed:
            return "Windows closed"
        }
    }
}

extension Car {
    mutating func handleEngine (status: EngineStatus) {
        engineStatus = status
    }
    
    mutating func handleWindows (status: WindowsStatus) {
        windowsStatus = status
    }
}

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
        return "Sport Car of \(model) model \(year) year of release.\nEngine status: \(engineStatus).\nWindows status: \(windowsStatus).\nTurbo mode status: \(turboModeStatus)."
    }
}

print("sportCar")
print("-----------------------------------")

var sportCar = SportCar(model: "Ferrari", year: 2018)
sportCar.buy()
sportCar.handleEngine(status: .on)
sportCar.handleTurboMode(status: .on)
print(sportCar)

print("===================================")

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

print("trunkCar")
print("-----------------------------------")

var trunkCar = TrunkCar(model: "Volvo", year: 2017, bodyVolume: 5000.00)
trunkCar.buy()
trunkCar.handleEngine(status: .on)
trunkCar.handleWindows(status: .open)

for _ in 1...4 {
    trunkCar.hanldeBodyLoading(action: .load(volume: 1300))
}

for _ in 1...3 {
    trunkCar.hanldeBodyLoading(action: .unload(volume: 1400))
}

print(trunkCar)
