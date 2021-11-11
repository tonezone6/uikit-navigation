
import UIKit

class CSecondViewController: UIViewController {
    weak var coordinator: CCoordinator?
    
    override func loadView() {
        let sui = CSecondView()
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
