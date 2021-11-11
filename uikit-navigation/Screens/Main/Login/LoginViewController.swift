
import UIKit

class LoginViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        var sui = LoginView()
        
        sui.onLoginButtonTap = { [weak self] in
            self?.finishLogin()
        }
        sui.onRegisterButtonTap = { [weak self] in
            self?.coordinator?.pushRegister()
        }
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self, action: #selector(finishLogin)
        )
    }
    
    @objc private func finishLogin() {
        coordinator?.finishLogin()
    }
}
