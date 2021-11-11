
import UIKit

protocol DetailsPushable: Coordinator {
    func pushDetails()
}

extension DetailsPushable {
    func pushDetails() {
        let vc = DetailsViewController()
        vc.title = "Details"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
