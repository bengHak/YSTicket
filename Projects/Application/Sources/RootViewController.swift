import SnapKit
import Then
import UIKit

import DIKit
import DomainKit
import PresentationKit

final class RootViewController: UIViewController {
    // MARK: - UI properties
    private let label: UILabel = .init().then {
        $0.text = "Application"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 47, weight: .semibold)
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Helpers
    private func configureView() {
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
