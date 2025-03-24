import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        channel = FlutterMethodChannel(name: "com.clean.pattern",
                                       binaryMessenger: controller.binaryMessenger)
        
        channel!.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "getBatteryLevel" :
                self.getBatteryLevel(result: result)
            case "luckyNumber":
                self.luckyNumber()
            default:
                result(FlutterMethodNotImplemented)
            }
        })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
    } else {
        result(Int(device.batteryLevel * 100))
    }
  }
    
  private func luckyNumber() {
    let lucky = Int.random(in: 0 ... 100)
    channel!.invokeMethod("luckyNumber", arguments: lucky)
  }
}
