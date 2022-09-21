import '../../domain/entities/video_data.dart';

class VideoDataModel extends VideoData {
  const VideoDataModel({
    required super.id,
    required super.duration,
    required super.title,
    required super.originCover,
    required super.playVideo,
    required super.wmPlayVideo,
    required super.music,
    required super.playCount,
    required super.downloadCount,
  });

  factory VideoDataModel.fromJson(Map<String, dynamic> json) {
    return VideoDataModel(
      id: json["id"],
      duration: json["duration"],
      title: json["title"],
      originCover: json["origin_cover"],
      playVideo: json["play"],
      wmPlayVideo: json["wmplay"],
      music: json["music"],
      playCount: json["play_count"],
      downloadCount: json["download_count"],
    );
  }
}
