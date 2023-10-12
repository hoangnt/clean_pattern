import 'package:clean_pattern/app.dart';
import 'package:clean_pattern/common/constant/app_shared.dart';
import 'package:clean_pattern/common/utilities/notification_util.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/config/flavor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config
  Flavor.env = Environment.stg;
  await AppShared.init();
  ConfigLoading.configLoading();

  runApp(MyApp());
  FirebaseMessaging.onBackgroundMessage(NotificationUtils.backgroundHandler);
}
