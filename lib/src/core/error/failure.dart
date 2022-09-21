import '../api/response_message.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure() : super(message: ResponseMessage.BAD_REQUEST);
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: ResponseMessage.INTERNAL_SERVER_ERROR);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(message: ResponseMessage.NOT_FOUND);
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure()
      : super(message: ResponseMessage.NO_INTERNET_CONNECTION);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super(message: ResponseMessage.UNEXPECTED);
}

class ConnectTimeOutFailure extends Failure {
  const ConnectTimeOutFailure()
      : super(message: ResponseMessage.CONNECT_TIMEOUT);
}

class CancelRequestFailure extends Failure {
  const CancelRequestFailure() : super(message: ResponseMessage.CANCEL);
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure({required String? message})
      : super(message: message ?? ResponseMessage.TOOMANYREQUESTS);
}
