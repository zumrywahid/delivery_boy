# delivery_boy

Flutter based Simple UI concept for a Delivery personal.

Please add your Map API key in

Folder/ios/Runner/AppDelegate.swift


```
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR API KEY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

```



<img src="https://raw.githubusercontent.com/zumrywahid/delivery_boy/8c848df9298ab448f2b686f60f72cd415803e911/screen1.png" width="200"> <img src="https://raw.githubusercontent.com/zumrywahid/delivery_boy/8c848df9298ab448f2b686f60f72cd415803e911/screen2.png" width="200"> <img src="https://raw.githubusercontent.com/zumrywahid/delivery_boy/8c848df9298ab448f2b686f60f72cd415803e911/screen3.png" width="200">

<img src="https://raw.githubusercontent.com/zumrywahid/delivery_boy/8c848df9298ab448f2b686f60f72cd415803e911/screen4.png" width="200"> <img src="https://raw.githubusercontent.com/zumrywahid/delivery_boy/8c848df9298ab448f2b686f60f72cd415803e911/screen5.png" width="200"> <img src="https://raw.githubusercontent.com/zumrywahid/delivery_boy/8c848df9298ab448f2b686f60f72cd415803e911/screen2.png" width="200">
