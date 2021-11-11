
import UIKit

class SearchCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SearchViewController()
        vc.title = "Recent"
        vc.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushResults() {
        let vc = SearchResultsViewController()
        vc.title = "Results"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finishSearch() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}

/// Intercepting back button action for removing child coordinator.
extension SearchCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        
        if type(of: viewController) != SearchViewController.self &&
           type(of: viewController) != SearchResultsViewController.self {
            parentCoordinator?.childDidFinish(self)
        }
    }
}
