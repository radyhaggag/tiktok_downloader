import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseUseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {
  const NoParams._internal();

  static const NoParams _instance = NoParams._internal();

  factory NoParams() => _instance;
}
