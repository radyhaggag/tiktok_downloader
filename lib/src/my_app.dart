import 'package:flutter/material.dart';

import 'config/routes_manager.dart';
import 'config/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.getRoute,
      theme: getAppTheme(),
    );
  }
}
