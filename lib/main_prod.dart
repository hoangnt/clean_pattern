import 'package:clean_pattern/app.dart';
import 'package:clean_pattern/common/utilities/di.dart';
import 'package:clean_pattern/common/utilities/permission_util.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/config/flavor.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config
  Flavor.env = Environment.prod;
  ConfigLoading.configLoading();

  // injection
  homeInjection();

  // permission
  PermissionUtil.getStoragePermission();

  runApp(MyApp());
}
