import 'features/tiktok_downloader/downloader_injector.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/helpers/dio_helper.dart';
import 'core/api/interceptors.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

void initCore() {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  sl.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  // Dio Factory
  sl.registerLazySingleton<DioHelper>(
    () => DioHelper(dio: sl<Dio>()),
  );
  // Network info
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl<InternetConnectionChecker>()),
  );
  // Internet Connection Checker
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
}

void initApp() {
  // Init core injector
  initCore();
  // Init downloader Bloc
  initDownloader();
}
