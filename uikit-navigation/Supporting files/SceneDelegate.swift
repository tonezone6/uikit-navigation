
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let center = UNUserNotificationCenter.current()
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        coordinator = MainCoordinator(navigationController: UINavigationController())
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
        
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            print("user notification center, request authorization granted", granted)
        }

        coordinator?.start()
    }
}

// MARK: Push notifications.

extension SceneDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void) {
        
        do {
            let json = response.notification.request.content.userInfo
            let data = try JSONSerialization.data(withJSONObject: json)
            let payload = try JSONDecoder().decode(Push.Payload.self, from: data)

            coordinator?.activeTabCoordinator?.finishActiveFlows()
            coordinator?.activeTabCoordinator?.route(payload.route)
        } catch {
            print("error parsing user notification", error.localizedDescription)
        }
            
        completionHandler()
    }
}
