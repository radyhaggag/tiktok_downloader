import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes_manager.dart';
import 'config/theme_manager.dart';
import 'container_injector.dart';
import 'features/tiktok_downloader/presentation/bloc/downloader_bloc/downloader_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DownloaderBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: AppRouter.getRoute,
        theme: getAppTheme(),
      ),
    );
  }
}
