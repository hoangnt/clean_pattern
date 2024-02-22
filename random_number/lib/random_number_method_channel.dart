import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'random_number_platform_interface.dart';

/// An implementation of [RandomNumberPlatform] that uses method channels.
class MethodChannelRandomNumber extends RandomNumberPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel("com.my.plugin.random_number");

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int> luckyNumber() async {
    final luckyNumber = await methodChannel.invokeMethod<int>('luckyNumber');
    return luckyNumber ?? 0;
  }
}
