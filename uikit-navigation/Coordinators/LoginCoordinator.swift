
import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController()
        vc.title = "Login"
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func pushRegister() {
        let vc = RegisterViewController()
        vc.title = "Register"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finishLogin() {
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true, completion: nil)
    }
}

/// Composable login coordinator.
protocol LoginPresentable: Coordinator {
    func presentLogin()
}

extension LoginPresentable {
    func presentLogin() {
        let coordinator = LoginCoordinator(navigationController: UINavigationController())
        childCoordinators.append(coordinator)

        coordinator.parentCoordinator = self
        coordinator.start()
        
        navigationController.present(
            coordinator.navigationController,
            animated: true, completion: nil
        )
        
        logDetails()
    }
}
