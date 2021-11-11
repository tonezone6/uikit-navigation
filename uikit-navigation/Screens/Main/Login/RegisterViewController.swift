
import UIKit

class RegisterViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        var sui = RegisterView()
        
        sui.onRegisterButtonTap = { [weak self] in
            self?.coordinator?.finishLogin()
        }
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
