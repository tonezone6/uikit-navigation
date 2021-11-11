
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstCoordinator  = ACoordinator(navigationController: UINavigationController())
        let secondCoordinator = BCoordinator(navigationController: UINavigationController())
        let thirdCoordinator  = CCoordinator(navigationController: UINavigationController())
        
        firstCoordinator.active = true
        firstCoordinator.navigationController.tabBarItem  = UITabBarItem(tab: .first)
        secondCoordinator.navigationController.tabBarItem = UITabBarItem(tab: .second)
        thirdCoordinator.navigationController.tabBarItem  = UITabBarItem(tab: .third)
                
        childCoordinators.append(firstCoordinator)
        childCoordinators.append(secondCoordinator)
        childCoordinators.append(thirdCoordinator)
                
        let vc = TabBarViewController()
        vc.coordinator = self
        vc.setViewControllers([
            firstCoordinator.navigationController,
            secondCoordinator.navigationController,
            thirdCoordinator.navigationController], animated: false
        )
        
        navigationController.setViewControllers([vc], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        firstCoordinator.start()
        secondCoordinator.start()
        thirdCoordinator.start()
        
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
