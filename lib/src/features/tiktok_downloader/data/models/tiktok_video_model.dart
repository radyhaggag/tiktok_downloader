import '../../domain/entities/tiktok_video.dart';
import '../../domain/mappers.dart';
import 'video_data_model.dart';

class TiktokVideoModel extends TikTokVideo {
  const TiktokVideoModel({
    required super.code,
    required super.msg,
    required super.processedTime,
    required super.videoData,
  });

  factory TiktokVideoModel.fromJson(Map<String, dynamic> json) {
    return TiktokVideoModel(
      code: json["code"],
      msg: json["msg"],
      videoData: json["data"] != null
          ? VideoDataModel.fromJson(json["data"]).toDomain()
          : null,
      processedTime: json["processed_time"],
    );
  }
}
