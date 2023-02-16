import UIKit

import DataKit
import DIKit
import DomainKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let window: UIWindow = .init()
        self.window = window
        window.rootViewController = RootViewController()
        window.makeKeyAndVisible()
        return true
    }
}
