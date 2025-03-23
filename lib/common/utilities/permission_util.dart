import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<void> getStoragePermission() async {
    bool isGranted = await Permission.storage.isGranted;
    if (!isGranted) {
      Permission.storage.request();
    }
  }

  static Future<void> getCameraAndPhotoPermission() async {
    bool cameraIsGranted = await Permission.camera.isGranted;
    if (!cameraIsGranted) {
      await Permission.camera.request();
    }

    bool storageIsGranted = await Permission.storage.isGranted;
    if (!storageIsGranted) {
      await Permission.photos.request();
    }
  }
}
