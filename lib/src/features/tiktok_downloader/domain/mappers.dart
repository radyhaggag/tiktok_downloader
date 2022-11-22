import '../data/models/tiktok_video_model.dart';
import '../data/models/video_data_model.dart';
import 'entities/tiktok_video.dart';
import 'entities/video_data.dart';

extension TiktokVideoExtension on TiktokVideoModel {
  TikTokVideo toDomain() => TikTokVideo(
        code: code,
        msg: msg,
        processedTime: processedTime,
        videoData: videoData,
      );
}

extension VideoDataExtension on VideoDataModel {
  VideoData toDomain() => VideoData(
        id: id,
        duration: duration,
        title: title,
        originCover: originCover,
        playVideo: playVideo,
        wmPlayVideo: wmPlayVideo,
        music: music,
        playCount: playCount,
        downloadCount: downloadCount,
      );
}
