import 'package:clean_pattern/app.dart';
import 'package:clean_pattern/common/utilities/local_secure_storage_util.dart';
import 'package:clean_pattern/common/utilities/local_storage_util.dart';
import 'package:clean_pattern/config/injection.dart';
import 'package:clean_pattern/common/utilities/permission_util.dart';
import 'package:clean_pattern/config/flavor.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config
  Flavor.env = Environment.dev;

  // permission
  PermissionUtil.getStoragePermission();

  // injection
  await LocalStorageUtil.instance.init();
  final accessToken = await LocalSecureStorageUtil.instance.getAccessToken();
  await dependenciesInjection();

  runApp(MyApp(accessToken));
}
