import UIKit

enum Actions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case load(volume: Double)
    case unload(volume: Double)
}

struct Sedan {
    private let model: String
    private let year: String
    private let trunkVolume: Double
    private var engineStarted: Bool = false {
        didSet {
            print("Двигатель \(engineStarted ? "заведен" : "заглушен")")
        }
    }
    private var windowsOpen: Bool = false {
        didSet {
            print("Окна \(windowsOpen ? "открыты" : "закрыты")")
        }
    }
    private var trunkFilledVolume: Double = 0 {
        didSet {
            print("Багажник заполнен на \(trunkFilledPercent()) %, можно загрузить еще \(trunkVolume - trunkFilledVolume) кг")
        }
    }
    
    init(model: String, year: String, trunkVolume: Double) {
        self.model = model
        self.year = year
        self.trunkVolume = trunkVolume
    }
    
    mutating func act (action: Actions) {
        switch action {
        case .startEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
        case .load(let volume) where self.trunkFilledVolume + volume >= trunkVolume:
            print("В багажнике недостаточно места для загрузки \(volume) кг!")
        case .load(let volume):
            trunkFilledVolume += volume
        case .unload where self.trunkFilledVolume == 0:
            print("Багажник пуст, нечего выгружать!")
        case .unload(let volume):
            trunkFilledVolume -= volume <= trunkFilledVolume ? volume : trunkFilledVolume
        }
    }
    
    func trunkFilledPercent () -> Double {
        return trunkFilledVolume * 100 / trunkVolume
    }
}

var sedan = Sedan(model: "Nissan", year: "2017", trunkVolume: 800)

for _ in 1...3 {
    sedan.act(action: Actions.load(volume: 300))
}

for _ in 1...3 {
    sedan.act(action: Actions.unload(volume: 400))
}

sedan.act(action: Actions.openWindows)
sedan.act(action: Actions.startEngine)
print("sedan:", sedan)

print("===================================")

struct Truck {
    private let model: String
    private let year: String
    private let bodyVolume: Double
    private var engineStarted: Bool = false {
        didSet {
            print("Двигатель \(engineStarted ? "заведен" : "заглушен")")
        }
    }
    private var windowsOpen: Bool = false {
        didSet {
            print("Окна \(windowsOpen ? "открыты" : "закрыты")")
        }
    }
    private var bodyFilledVolume: Double = 0 {
        didSet {
            print("Кузов заполнен на \(bodyFilledPercent()) %, можно загрузить еще \(bodyVolume - bodyFilledVolume) кг")
        }
    }
    
    init(model: String, year: String, bodyVolume: Double) {
        self.model = model
        self.year = year
        self.bodyVolume = bodyVolume
    }
    
    mutating func act (action: Actions) {
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

var truck1 = Truck(model: "Volvo", year: "2015", bodyVolume: 5000)

for _ in 1...4 {
    truck1.act(action: Actions.load(volume: 1300))
}

for _ in 1...3 {
    truck1.act(action: Actions.unload(volume: 1400))
}

truck1.act(action: Actions.openWindows)
truck1.act(action: Actions.startEngine)
print("truck1:", truck1)

print("===================================")

var truck2 = Truck(model: "Volvo", year: "2015", bodyVolume: 5000)

truck2.act(action: Actions.load(volume: 5300))
truck2.act(action: Actions.load(volume: 4300))
truck2.act(action: Actions.openWindows)
truck2.act(action: Actions.closeWindows)
truck2.act(action: Actions.startEngine)
truck2.act(action: Actions.stopEngine)
print("truck2:", truck2)
