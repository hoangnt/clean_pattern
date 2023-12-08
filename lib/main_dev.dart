import 'package:clean_pattern/app.dart';
import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/utilities/di.dart';
import 'package:clean_pattern/common/utilities/permission_util.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/config/flavor.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config
  Flavor.env = Environment.dev;
  ConfigLoading.configLoading();

  // permission
  PermissionUtil.getStoragePermission();

  // injection
  await AppLocalStorage.instance.init();
  await dependenciesInjection();

  runApp(MyApp());
}
