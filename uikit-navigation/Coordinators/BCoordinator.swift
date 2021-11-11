
import UIKit

class BCoordinator: TabCoordinator, DetailsPushable {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var active: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BFirstViewController()
        vc.title = "First"
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func finishActiveFlows() {
        // ...
    }
    
    func route(_ route: Push.Route) {
        // ...
    }
}
