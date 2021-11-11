
import UIKit

class AFirstViewController: UIViewController {
    weak var coordinator: ACoordinator?
    
    override func loadView() {
        var sui = AFirstView()
        sui.onSecond =  { [weak self] in self?.coordinator?.pushSecond() }
        sui.onLogin =   { [weak self] in self?.coordinator?.presentLogin() }
        sui.onSearch =  { [weak self] in self?.coordinator?.pushSearch() }
        sui.onDetails = { [weak self] in self?.coordinator?.pushDetails() }
        
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

