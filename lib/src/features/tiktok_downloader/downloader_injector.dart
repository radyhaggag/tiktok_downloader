import '../../container_injector.dart';
import 'data/datasources/remote/tiktok_video_remote_data_source.dart';
import 'data/repositories/tiktok_video_repo.dart';
import 'domain/repositories/tiktok_video_base_repo.dart';
import 'domain/usecases/get_video_usecase.dart';
import 'domain/usecases/save_video_usecase.dart';
import 'presentation/bloc/downloader_bloc/downloader_bloc.dart';

void initDownloader() {
  // data source
  sl.registerLazySingleton<TiktokVideoBaseRemoteDataSource>(
    () => TiktokVideoRemoteDataSource(dioHelper: sl()),
  );
  // repository
  sl.registerLazySingleton<TiktokVideoBaseRepo>(
    () => TiktokVideoRepo(remoteDataSource: sl(), networkInfo: sl()),
  );
  // use-case
  sl.registerLazySingleton<GetVideoUseCase>(
    () => GetVideoUseCase(videoRepo: sl()),
  );
  sl.registerLazySingleton<SaveVideoUseCase>(
    () => SaveVideoUseCase(videoRepo: sl()),
  );
  // downloader bloc
  sl.registerFactory(
    () => DownloaderBloc(getVideoUseCase: sl(), saveVideoUseCase: sl()),
  );
}
