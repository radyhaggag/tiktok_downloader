import '../../../../../core/helpers/dio_helper.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../models/tiktok_video_model.dart';

abstract class TiktokVideoBaseRemoteDataSource {
  Future<TiktokVideoModel> getVideo(String videoLink);

  Future<String> saveVideo({
    required String videoLink,
    required String savePath,
  });
}

class TiktokVideoRemoteDataSource implements TiktokVideoBaseRemoteDataSource {
  final DioHelper dioHelper;

  TiktokVideoRemoteDataSource({required this.dioHelper});

  @override
  Future<TiktokVideoModel> getVideo(String videoLink) async {
    try {
      final response = await dioHelper.get(
        path: AppConstants.getVideoEndpoint,
        queryParams: {"url": videoLink},
      );
      return TiktokVideoModel.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<String> saveVideo({
    required String videoLink,
    required String savePath,
  }) async {
    try {
      await dioHelper.download(savePath: savePath, downloadLink: videoLink);
      return AppStrings.downloadSuccess;
    } catch (error) {
      rethrow;
    }
  }
}
