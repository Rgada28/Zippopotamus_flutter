import 'package:dartz/dartz.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';
import 'package:zippopotamus/modules/home/domain/usecases/fetch_pin_data.dart';
import 'package:zippopotamus/utils/http_error.dart';

abstract class HomeRepository {
  Future<Either<HttpError, PinModel>> getPin({required PinUseCaseModel params});
}
