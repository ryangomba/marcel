import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SoundManager.configureAudioSession()

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = IntroViewController.init()
        self.window?.makeKeyAndVisible()

        return true
    }
}
