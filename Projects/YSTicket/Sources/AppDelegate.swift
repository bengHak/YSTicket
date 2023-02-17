import UIKit

import DataKit
import DIKit
import DomainKit
import PresentationKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        registerContainers()
        showRootViewController()
        return true
    }
    
    private func registerContainers() {
        DIContainer.container.register(FeedServiceProtocol.self) { _ in
            return FeedService()
        }
        DIContainer.container.register(FeedRepositoryProtocol.self) { r in
            return FeedRepository(feedService: r.resolve(FeedServiceProtocol.self)!)
        }
        DIContainer.container.register(FetchFeedUseCase.self) { r in
            return FetchFeedUseCase(feedRepository: r.resolve(FeedRepositoryProtocol.self)!)
        }
        DIContainer.container.register(MainFeedViewModelProtocol.self) { r in
            return MainFeedViewModel(fetchFeedUseCase: r.resolve(FetchFeedUseCase.self)!)
        }
    }
    
    private func showRootViewController() {
        let window: UIWindow = .init()
        self.window = window
        window.rootViewController = RootViewController()
        window.makeKeyAndVisible()
    }
}
