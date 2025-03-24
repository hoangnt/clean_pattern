package com.example.clean_pattern

import android.content.Context
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "com.clean.pattern"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        )
        channel.setMethodCallHandler { call, result ->
            // This method is invoked on the main thread.
            when (call.method) {
                "getBatteryLevel" -> getBatteryLevel(result)
                "luckyNumber" -> luckyNumber(result)
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getBatteryLevel(result: MethodChannel.Result) {
        val batteryLevel: Int = 50
        result.success(batteryLevel)
    }

    private fun luckyNumber(result: MethodChannel.Result) {
        val lucky = (0..99).random()
        channel.invokeMethod("luckyNumber", lucky)
    }
}
