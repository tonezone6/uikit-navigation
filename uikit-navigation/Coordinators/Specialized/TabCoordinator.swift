
import UIKit

enum Push {
    enum Route: String, Decodable {
        case details, search
    }
    
    struct Payload: Decodable {
        let route: Route
    }
}

/// Specialized type of coordinator handling tab
/// navigation and route push notification destination.
protocol TabCoordinator: Coordinator {
    var active: Bool { get set }
    func finishActiveFlows() // prepare for routing
    func route(_ route: Push.Route)
}

extension MainCoordinator {
    var activeTabCoordinator: TabCoordinator? {
        for child in childCoordinators {
            if let coordinator = child as? TabCoordinator,
                coordinator.active {
                return coordinator
            }
        }
        return nil
    }
    
    func makeActive(tab: Tab) {
        for coordinator in childCoordinators {
            (coordinator as? TabCoordinator)?.active = false
            
            switch tab {
            case .A: (coordinator as? ACoordinator)?.active = true
            case .B: (coordinator as? BCoordinator)?.active = true
            case .C: (coordinator as? CCoordinator)?.active = true
            }
        }
    }
}
