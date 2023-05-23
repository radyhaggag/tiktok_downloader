import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../widgets/downloads_screen/downloads_screen_body.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.downloads),
      ),
      body: const DownloadsScreenBody(),
    );
  }
}
