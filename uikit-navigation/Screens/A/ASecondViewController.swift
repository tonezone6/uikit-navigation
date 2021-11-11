
import UIKit

class ASecondViewController: UIViewController {
    weak var coordinator: ACoordinator?
    
    override func loadView() {
        let sui = ASecondView()
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
