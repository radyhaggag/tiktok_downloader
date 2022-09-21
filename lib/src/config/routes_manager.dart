import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../container_injector.dart';
import '../features/tiktok_downloader/presentation/controller/downloader_bloc/downloader_bloc.dart';
import '../features/tiktok_downloader/presentation/screens/downloader_screen.dart';
import '../features/tiktok_downloader/presentation/screens/downloads_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String downloader = "/downloader";
  static const String downloads = "/downloads";
}

class AppRouter {
  static final downloaderBloc = sl<DownloaderBloc>();

  static Route? getRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.downloader:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => downloaderBloc,
            child: const DownloaderScreen(),
          ),
        );
      case Routes.downloads:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<DownloaderBloc>.value(
            value: downloaderBloc,
            child: const DownloadsScreen(),
          ),
        );
    }
    return null;
  }
}
