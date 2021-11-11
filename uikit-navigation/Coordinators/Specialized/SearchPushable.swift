
import UIKit

protocol SearchPushable: Coordinator {
    func pushSearch()
}

extension SearchPushable {
    func pushSearch() {
        let coordinator = SearchCoordinator(navigationController: self.navigationController)
        childCoordinators.append(coordinator)

        coordinator.parentCoordinator = self
        coordinator.start()
                
        logDetails()
    }
}
