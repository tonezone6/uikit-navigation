
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let aCoordinator = ACoordinator(navigationController: UINavigationController())
        let bCoordinator = BCoordinator(navigationController: UINavigationController())
        let cCoordinator = CCoordinator(navigationController: UINavigationController())
        
        aCoordinator.active = true
        aCoordinator.navigationController.tabBarItem = UITabBarItem(tab: .A)
        bCoordinator.navigationController.tabBarItem = UITabBarItem(tab: .B)
        cCoordinator.navigationController.tabBarItem = UITabBarItem(tab: .C)
                
        childCoordinators.append(aCoordinator)
        childCoordinators.append(bCoordinator)
        childCoordinators.append(cCoordinator)
                
        let vc = TabBarViewController()
        vc.coordinator = self
        vc.setViewControllers([
            aCoordinator.navigationController,
            bCoordinator.navigationController,
            cCoordinator.navigationController], animated: false
        )
        
        navigationController.setViewControllers([vc], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        aCoordinator.start()
        bCoordinator.start()
        cCoordinator.start()
        
        logDetails()
    }
}

extension UITabBarItem {
    convenience init(tab: Tab) {
        self.init(
            title: nil,
            image: UIImage(systemName: tab.icon),
            tag: tab.tag
        )
    }
}
