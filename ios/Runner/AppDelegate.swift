import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [GMSServices provideAPIKey:@"AIzaSyAxHc2YDwNlwAoidmAYKHd-8YlyH_O8J40"];
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
