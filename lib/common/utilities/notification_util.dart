import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationUtils {
  static final NotificationUtils _singleton = NotificationUtils._();
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationUtils() {
    return _singleton;
  }

  NotificationUtils._();

  // config variable
  static int idNotification = 0;
  static String _lastNotiId = "";
  static const String iconNoti = "@mipmap/launcher_icon";
  static const String androidNotiChannelId = "channel_id";
  static const String androidNotiChannelName = "Channel Name";
  static const NotificationDetails notiDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      androidNotiChannelId,
      androidNotiChannelName,
      icon: iconNoti,
      priority: Priority.high,
      importance: Importance.high,
      enableVibration: true,
    ),
  );

  static void listenNotificationForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Message: ${message.data}');

      if (message.data["title"] != null && message.data["id"] != _lastNotiId) {
        _lastNotiId = message.data["id"];
        idNotification += 1;
        await flutterLocalNotificationsPlugin.show(
          idNotification,
          message.notification?.title,
          message.notification?.body,
          notiDetails,
          payload: json.encode(message.data),
        );
      }
    });
  }

  @pragma('vm:entry-point')
  static Future<void> backgroundHandler(RemoteMessage message) async {
    print('Message: ${message.data}');

    if (message.data["title"] != null && message.data["id"] != _lastNotiId) {
      _lastNotiId = message.data["id"];
      idNotification += 1;
      await flutterLocalNotificationsPlugin.show(
        idNotification,
        message.notification?.title,
        message.notification?.body,
        notiDetails,
        payload: json.encode(message.data),
      );
    }
  }

  static Future<void> _appTerminatedHandler() async {
    NotificationAppLaunchDetails? data =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (data == null) {
      return;
    }

    if (!data.didNotificationLaunchApp) {
      return;
    }

    if (data.notificationResponse == null ||
        data.notificationResponse!.payload == null) {
      return;
    }

    // Map<String, dynamic> notify =
    //     json.decode(data.notificationResponse!.payload!);
    // print(notify);
  }

  static Future<void> setupFlutterNotifications() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(iconNoti);
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onSelectNotification,
      onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      androidNotiChannelId,
      androidNotiChannelName,
      description: 'project noti decription',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _appTerminatedHandler();
  }

  // need fully uninstall and install app
  @pragma('vm:entry-point')
  static void _onSelectNotification(NotificationResponse? payload) {
    if (payload == null || payload.payload == null) {
      debugPrint("no payload data");
      return;
    }

    print(json.decode(payload.payload!));
    Navigator.popUntil(
      Get.context!,
      (route) => route.isFirst,
    );
  }

  static Future<String?> getToken() async {
    String? token;
    try {
      token = await FirebaseMessaging.instance.getToken();
      print("FCM token: $token");
    } catch (e) {
      return null;
    }

    return token;
  }

  static Future<void> deleteToken() async {
    idNotification = 0;
    await FirebaseMessaging.instance.deleteToken();
  }
}
