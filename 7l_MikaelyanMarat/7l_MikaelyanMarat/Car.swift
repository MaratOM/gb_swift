import Foundation

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
