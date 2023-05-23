import 'dart:io';

import 'package:video_player/video_player.dart';

class VideoItem {
  final String path;
  late VideoPlayerController controller;
  String? thumbnailPath;

  VideoItem({required this.path}) {
    controller = VideoPlayerController.file(File(path));
  }
}
