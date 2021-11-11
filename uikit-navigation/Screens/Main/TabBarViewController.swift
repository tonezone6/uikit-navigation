
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
        let tab = Tab(tag: item.tag)
        coordinator?.makeActive(tab: tab)
    }
}
