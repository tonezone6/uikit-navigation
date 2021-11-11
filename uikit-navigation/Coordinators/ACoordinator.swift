
import UIKit

class ACoordinator: TabCoordinator, LoginPresentable, SearchPushable, DetailsPushable {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var active: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AFirstViewController()
        vc.title = "First"
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func pushSecond() {
        let vc = ASecondViewController()
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
            pushSearch()
        }
    }
}
