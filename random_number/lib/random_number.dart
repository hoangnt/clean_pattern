library random_number;

import 'random_number_platform_interface.dart';

class RandomNumber {
  static final RandomNumber instance = RandomNumber._();
  RandomNumber._();

  Future<String?> getPlatformVersion() {
    return RandomNumberPlatform.instance.getPlatformVersion();
  }

  Future<int> luckyNumber() async =>
      await RandomNumberPlatform.instance.luckyNumber();
}
