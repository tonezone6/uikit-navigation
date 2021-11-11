
import UIKit

class SearchResultsViewController: UIViewController {
    weak var coordinator: SearchCoordinator?
    
    override func loadView() {
        let sui = SearchResultsView()
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
