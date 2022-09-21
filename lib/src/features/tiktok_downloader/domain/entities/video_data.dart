import 'package:equatable/equatable.dart';

class VideoData extends Equatable {
  final String id;
  final int duration;
  final String title;
  final String originCover;
  final String playVideo;
  final String wmPlayVideo;
  final String music;
  final int playCount;
  final int downloadCount;

  const VideoData({
    required this.id,
    required this.duration,
    required this.title,
    required this.originCover,
    required this.playVideo,
    required this.wmPlayVideo,
    required this.music,
    required this.playCount,
    required this.downloadCount,
  });

  @override
  List<Object> get props => [
        id,
        duration,
        title,
        originCover,
        playVideo,
        wmPlayVideo,
        music,
        playCount,
        downloadCount,
      ];
}
