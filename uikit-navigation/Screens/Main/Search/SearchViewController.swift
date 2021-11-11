
import UIKit

class SearchViewController: UIViewController {
    weak var coordinator: SearchCoordinator?
    
    override func loadView() {
        var sui = SearchView()
        sui.onSearchResults = { [weak self] in
            self?.coordinator?.pushResults()
        }
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
