// Package imports:
import 'package:dartz/dartz.dart';
import 'package:zippopotamus/utils/http_error.dart';

// Project imports:

abstract class BaseUsecase<Type, T> {
  Future<Either<HttpError, Type>> call(T params);
}

abstract class Params {}
