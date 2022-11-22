import 'package:equatable/equatable.dart';

import 'video_data.dart';

class TikTokVideo extends Equatable {
  final int code;
  final String msg;
  final double processedTime;
  final VideoData? videoData;

  const TikTokVideo({
    required this.code,
    required this.msg,
    required this.processedTime,
    required this.videoData,
  });

  @override
  List<Object?> get props => [code, msg, processedTime, videoData];
}
