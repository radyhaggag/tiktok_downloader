import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/app_colors.dart';

class VideoPlayerView extends StatefulWidget {
  final String videoPath;
  const VideoPlayerView({super.key, required this.videoPath});

  @override
  VideoPlayerViewState createState() => VideoPlayerViewState();
}

class VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(File(widget.videoPath));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: RotatedBox(
        quarterTurns: _isFullScreen ? 1 : 0,
        child: Center(
          child: Stack(
            children: [
              Chewie(
                controller: _chewieController,
              ),
              Positioned(
                top: 35,
                left: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColors.grey,
                    child: Icon(
                      Icons.close,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
