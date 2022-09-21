import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repositories/tiktok_video_base_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/tiktok_video.dart';

class GetVideoUseCase extends BaseUseCase<TikTokVideo, String> {
  final TiktokVideoBaseRepo videoRepo;

  GetVideoUseCase({required this.videoRepo});

  @override
  Future<Either<Failure, TikTokVideo>> call(String params) async {
    return await videoRepo.getVideo(params);
  }
}
