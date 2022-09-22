import 'package:dio/dio.dart';
import '../../container_injector.dart';
import '../utils/app_constants.dart';
import '../api/interceptors.dart';

const String _CONTENT_TYPE = "Content-Type";
const String _APPLICATION_JSON = "application/json";
const int TIMEOUT = 20000;
// const String API_KEY = "Add your api key here for test";
const String API_KEY = "1e2d328129msha49fca00df6f881p147af8jsne121c53deae6";
const String API_HOST = "tiktok-download-without-watermark.p.rapidapi.com";

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio}) {
    Map<String, dynamic> headers = {
      _CONTENT_TYPE: _APPLICATION_JSON,
      "X-RapidAPI-Key": API_KEY,
      "X-RapidAPI-Host": API_HOST,
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: TIMEOUT,
      connectTimeout: TIMEOUT,
      headers: headers,
    );
    dio.interceptors.add(sl<LogInterceptor>());
    dio.interceptors.add(sl<AppInterceptors>());
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(path, queryParameters: queryParams);
  }

  Future<Response> download({
    required String downloadLink,
    required String savePath,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.download(downloadLink, savePath);
  }
}
