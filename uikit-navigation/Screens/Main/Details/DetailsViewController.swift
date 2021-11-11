
import UIKit

class DetailsViewController: UIViewController {
    weak var coordinator: DetailsPushable?
    
    override func loadView() {
        let sui = DetailsView()
        view = container(with: sui)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
