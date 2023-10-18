import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<void> getStoragePermission() async {
    bool isGranted = await Permission.storage.isGranted;
    if (!isGranted) {
      Permission.storage.request();
    }
  }
}
