import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/tiktok_video.dart';
import '../../domain/mappers.dart';
import '../../domain/repositories/tiktok_video_base_repo.dart';
import '../datasources/remote/tiktok_video_remote_data_source.dart';
import '../models/tiktok_video_model.dart';

class TiktokVideoRepo implements TiktokVideoBaseRepo {
  final TiktokVideoBaseRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TiktokVideoRepo({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, TikTokVideo>> getVideo(String videoLink) async {
    if (!await networkInfo.isConnected) {
      return const Left(NoInternetConnectionFailure());
    }
    try {
      final TiktokVideoModel video = await remoteDataSource.getVideo(videoLink);
      return Right(video.toDomain());
    } on DioError catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, String>> saveVideo(
      {required String videoLink, required String savePath}) async {
    if (!await networkInfo.isConnected) {
      return const Left(NoInternetConnectionFailure());
    }
    try {
      final String message = await remoteDataSource.saveVideo(
        savePath: savePath,
        videoLink: videoLink,
      );
      return Right(message);
    } on DioError catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
