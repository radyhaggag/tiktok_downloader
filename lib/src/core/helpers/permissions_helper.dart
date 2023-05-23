import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  static Future<bool> checkPermission() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      final storageStatus = await Permission.storage.request();
      final manageStatus = await Permission.manageExternalStorage.request();
      if (storageStatus.isGranted || manageStatus.isGranted) return true;
      return false;
    } else {
      return true;
    }
  }
}
