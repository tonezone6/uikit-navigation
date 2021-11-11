
import UIKit

class CFirstViewController: UIViewController {
    weak var coordinator: CCoordinator?
    
    override func loadView() {
        var sui = CFirstView()
        sui.onSecond = { [weak self] in self?.coordinator?.pushSecond() }
        sui.onLogin =  { [weak self] in self?.coordinator?.presentLogin() }
        
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
