import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else if (error is SocketException) {
      failure = const NoInternetConnectionFailure();
    } else {
      failure = const UnexpectedFailure();
    }
  }
}

Failure _handleError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      return const ConnectTimeOutFailure();
    case DioErrorType.response:
      return _handleResponseError(dioError.response);
    case DioErrorType.cancel:
      return const CancelRequestFailure();
    case DioErrorType.other:
      return const NoInternetConnectionFailure();
  }
}

Failure _handleResponseError(Response? response) {
  switch (response?.statusCode) {
    case 400:
      return const BadRequestFailure();
    case 403:
      return NotSubscribedFailure(message: response?.data['message']);
    case 429:
      return TooManyRequestsFailure(message: response?.data['message']);
    case 404:
      return const NotFoundFailure();
    case 500:
      return const ServerFailure();
    default:
      return const UnexpectedFailure();
  }
}
