package com.my.plugin.random_number

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** RandomNumberPlugin */
class RandomNumberPlugin : FlutterPlugin, MethodCallHandler {
  private val channelName = "com.my.plugin.random_number"
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(
      @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  ) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      "luckyNumber" -> result.success(luckyNumber())
      else -> {
          result.notImplemented()
      }
    }
  }

  private fun luckyNumber(): Int {
      val lucky = (0..99).random()
      // channel.invokeMethod("luckyNumber", lucky)
      return lucky
  }
}
