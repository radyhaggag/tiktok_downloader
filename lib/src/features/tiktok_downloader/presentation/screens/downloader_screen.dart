import 'package:flutter/material.dart';

import '../widgets/downloader_screen/downloader_screen_app_bar.dart';
import '../widgets/downloader_screen/downloader_screen_body.dart';

class DownloaderScreen extends StatelessWidget {
  const DownloaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DownloaderScreenAppBar(),
      body: DownloaderScreenBody(),
    );
  }
}
