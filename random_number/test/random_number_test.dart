// import 'package:flutter_test/flutter_test.dart';
// import 'package:random_number/random_number.dart';
// import 'package:random_number/random_number_platform_interface.dart';
// import 'package:random_number/random_number_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockRandomNumberPlatform
//     with MockPlatformInterfaceMixin
//     implements RandomNumberPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final RandomNumberPlatform initialPlatform = RandomNumberPlatform.instance;

//   test('$MethodChannelRandomNumber is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelRandomNumber>());
//   });

//   test('getPlatformVersion', () async {
//     RandomNumber randomNumberPlugin = RandomNumber();
//     MockRandomNumberPlatform fakePlatform = MockRandomNumberPlatform();
//     RandomNumberPlatform.instance = fakePlatform;

//     expect(await randomNumberPlugin.getPlatformVersion(), '42');
//   });
// }
