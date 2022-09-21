import '../../../../core/error/failure.dart';
import '../entities/tiktok_video.dart';
import 'package:dartz/dartz.dart';

abstract class TiktokVideoBaseRepo {
  Future<Either<Failure, TikTokVideo>> getVideo(String videoLink);

  Future<Either<Failure, String>> saveVideo({
    required String videoLink,
    required String savePath,
  });
}
