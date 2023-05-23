import 'package:flutter/material.dart';

import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/tiktok_downloader/presentation/screens/downloader_screen.dart';
import '../features/tiktok_downloader/presentation/screens/downloads_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String downloader = "/downloader";
  static const String downloads = "/downloads";
}

class AppRouter {
  static Route? getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.downloader:
        return MaterialPageRoute(
          builder: (context) => const DownloaderScreen(),
        );
      case Routes.downloads:
        return MaterialPageRoute(
          builder: (context) => const DownloadsScreen(),
        );
    }
    return null;
  }
}
