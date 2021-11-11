
import UIKit

class BFirstViewController: UIViewController {
    weak var coordinator: BCoordinator?
    
    override func loadView() {
        var sui = BFirstView()
        
        sui.onDetails = { [weak self] in
            self?.coordinator?.pushDetails()
        }
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
