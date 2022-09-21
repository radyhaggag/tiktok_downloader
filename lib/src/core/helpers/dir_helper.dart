import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DirHelper {
  static Future<String> getAppPath() async {
    String mainPath = await _getMainPath();
    String appPath = "$mainPath/TtkFiles";
    _createPathIfNotExist(appPath);
    return appPath;
  }

  static Future<String> _getMainPath() async {
    String appDownloadsPath = "";
    final dir = await getExternalStorageDirectory();
    List<String> pathDirs = dir?.path.split('/') ?? [];
    for (int i = 1; i < pathDirs.length; i++) {
      if (pathDirs[i] == "Android") break;
      appDownloadsPath = '$appDownloadsPath/${pathDirs[i]}';
    }
    return appDownloadsPath;
  }

  static Future<void> _createPathIfNotExist(String path) async {
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }
  }
}
