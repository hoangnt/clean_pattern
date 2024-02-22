import Flutter
import UIKit

public class RandomNumberPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.my.plugin.random_number", binaryMessenger: registrar.messenger())
    let instance = RandomNumberPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "luckyNumber":
      result(luckyNumber())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func luckyNumber() -> Int{
      let lucky = Int.random(in: 0 ... 100)
      // channel!.invokeMethod("luckyNumber", arguments: lucky)
      return lucky
  }
}
