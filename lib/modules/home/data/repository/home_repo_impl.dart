import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zippopotamus/modules/home/data/datasource/home_api.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';
import 'package:zippopotamus/modules/home/domain/repository/home_repository.dart';
import 'package:zippopotamus/modules/home/domain/usecases/fetch_pin_data.dart';
import 'package:zippopotamus/utils/http_error.dart';
import 'package:zippopotamus/utils/network_info.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi homeApi;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(this.homeApi, this.networkInfo);

  @override
  Future<Either<HttpError, PinModel>> getPin(
      {required PinUseCaseModel params}) async {
    if (await networkInfo.isConnected) {
      try {
        PinModel pinModel = await homeApi.getPinInfo(params);
        return Right(pinModel);
      } on DioException catch (e) {
        return Left(
          AppError(errorCode: e.response?.statusCode)
              .appErrorType(e.type, e.message),
        );
      }
    } else {
      return Left(NoInternetError());
    }
  }
}
