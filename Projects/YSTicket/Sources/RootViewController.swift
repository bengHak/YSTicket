import SnapKit
import Then
import UIKit

import DIKit
import DomainKit
import PresentationKit

final class RootViewController: UIViewController {
    // MARK: - UI properties
    private let label: UILabel = .init().then {
        $0.text = "YSTicket"
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
        dismissSplashViewAfter1Sec()
    }
    
    // MARK: - Helpers
    private func configureView() {
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func dismissSplashViewAfter1Sec() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.showMainFeedViewController()
        }
    }
    
    private func showMainFeedViewController() {
        let window: UIWindow? = view.window
        let viewModel: MainFeedViewModelProtocol = DIContainer.container.resolve(MainFeedViewModelProtocol.self)!
        let vc: MainFeedViewController = .init(viewModel: viewModel)
        let navVC: UINavigationController = .init(rootViewController: vc)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
