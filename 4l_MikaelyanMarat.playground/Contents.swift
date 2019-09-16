import UIKit

enum SportCarActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    
    case turnOnTurboMode
    case turnOffTurboMode
}

enum TrunkCarActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    
    case load(volume: Double)
    case unload(volume: Double)
}

class Car {
    var model: String?
    var year: Int?
    var engineStarted: Bool = false {
        didSet {
            print("Двигатель \(engineStarted ? "заведен" : "заглушен")")
        }
    }
    var windowsOpen: Bool = false {
        didSet {
            print("Окна \(windowsOpen ? "открыты" : "закрыты")")
        }
    }
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
}

class SportCar: Car {
    var turboModeTurnedOn: Bool = false {
        didSet {
            print("Турбо режим \(turboModeTurnedOn ? "включен" : "выключен")")
        }
    }
    
    override init(model: String, year: Int) {
        super.init(model: model, year: year)
    }
    
    func act (action: SportCarActions) {
        switch action {
        case .startEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
        case .turnOnTurboMode:
            turboModeTurnedOn = true
        case .turnOffTurboMode:
            turboModeTurnedOn = false
        }
    }
}

var sportCar = SportCar(model: "Nissan", year: 2017)

print("sportCar")
print("-----------------------------------")

sportCar.act(action: SportCarActions.openWindows)
sportCar.act(action: SportCarActions.closeWindows)
sportCar.act(action: SportCarActions.startEngine)
sportCar.act(action: SportCarActions.turnOnTurboMode)

print("===================================")

class TrunkCar: Car {
    private var bodyVolume: Double = 0
    private var bodyFilledVolume: Double = 0 {
        didSet {
            print("Кузов заполнен на \(self.bodyFilledPercent()) %, можно загрузить еще \(bodyVolume - bodyFilledVolume) кг")
        }
    }

    init(model: String, year: Int, bodyVolume: Double) {
        super.init(model: model, year: year)
        self.bodyVolume = bodyVolume
    }
    
    func act (action: TrunkCarActions) {
        switch action {
        case .startEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
        case .load(let volume) where self.bodyFilledVolume + volume >= bodyVolume:
            print("В Кузове недостаточно места для загрузки \(volume) кг!")
        case .load(let volume):
            bodyFilledVolume += volume
        case .unload where self.bodyFilledVolume == 0:
            print("Кузов пуст, нечего выгружать!")
        case .unload(let volume):
            bodyFilledVolume -= volume <= bodyFilledVolume ? volume : bodyFilledVolume
        }
    }
    
    func bodyFilledPercent () -> Double {
        return bodyFilledVolume * 100 / bodyVolume
    }
}

var trunkCar = TrunkCar(model: "Volvo", year: 2015, bodyVolume: 5000)

print("trunkCar")
print("-----------------------------------")

for _ in 1...4 {
    trunkCar.act(action: TrunkCarActions.load(volume: 1300))
}

for _ in 1...3 {
    trunkCar.act(action: TrunkCarActions.unload(volume: 1400))
}

trunkCar.act(action: TrunkCarActions.openWindows)
trunkCar.act(action: TrunkCarActions.startEngine)
