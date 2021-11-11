
import UIKit

class CCoordinator: TabCoordinator, LoginPresentable, DetailsPushable {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var active: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CFirstViewController()
        vc.title = "First"
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func pushSecond() {
        let vc = CSecondViewController()
        vc.title = "Second"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finishActiveFlows() {
        for coordinator in childCoordinators {
            (coordinator as? LoginCoordinator)?.finishLogin()
            (coordinator as? SearchCoordinator)?.finishSearch()
        }
    }
    
    func route(_ route: Push.Route) {
        switch route {
        case .details:
            pushDetails()
        case .search:
            break
        }
    }
}
