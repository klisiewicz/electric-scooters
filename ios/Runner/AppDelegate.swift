import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    initializeGoogleMaps();
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func initializeGoogleMaps() {
    var keys: NSDictionary?
    if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist") {
        keys = NSDictionary(contentsOfFile: path)
    }
    if let dict = keys {
        let googleMapsApiKey = dict["GoogleMapsApiKey"] as? String
        GMSServices.provideAPIKey(googleMapsApiKey!)
    }
  }
}
