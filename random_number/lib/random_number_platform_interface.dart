import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'random_number_method_channel.dart';

abstract class RandomNumberPlatform extends PlatformInterface {
  /// Constructs a RandomNumberPlatform.
  RandomNumberPlatform() : super(token: _token);

  static final Object _token = Object();

  static RandomNumberPlatform _instance = MethodChannelRandomNumber();

  /// The default instance of [RandomNumberPlatform] to use.
  ///
  /// Defaults to [MethodChannelRandomNumber].
  static RandomNumberPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RandomNumberPlatform] when
  /// they register themselves.
  static set instance(RandomNumberPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> luckyNumber() {
    throw UnimplementedError('luckyNumber() has not been implemented.');
  }
}
