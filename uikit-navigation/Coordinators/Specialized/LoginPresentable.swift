
import UIKit

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
