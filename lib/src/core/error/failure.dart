import 'package:equatable/equatable.dart';

import '../api/response_message.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure() : super(message: Authorized.badRequest);
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: Authorized.internalServerError);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(message: Authorized.notFound);
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure()
      : super(message: Authorized.noInternetConnection);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super(message: Authorized.unexpected);
}

class ConnectTimeOutFailure extends Failure {
  const ConnectTimeOutFailure() : super(message: Authorized.connectTimeOut);
}

class CancelRequestFailure extends Failure {
  const CancelRequestFailure() : super(message: Authorized.cancel);
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure({required String? message})
      : super(message: message ?? Authorized.tooManyRequests);
}

class NotSubscribedFailure extends Failure {
  const NotSubscribedFailure({required String? message})
      : super(message: message ?? Authorized.notSubscribed);
}
