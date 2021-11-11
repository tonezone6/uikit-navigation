
import UIKit

class TabBarViewController: UITabBarController {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        coordinator?.makeActive(tab: .init(tag: item.tag))
    }
}
