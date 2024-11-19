import 'package:dartz/dartz.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';
import 'package:zippopotamus/modules/home/domain/repository/home_repository.dart';
import 'package:zippopotamus/utils/base_use_case.dart';
import 'package:zippopotamus/utils/http_error.dart';

class FetchPinDataUseCase extends BaseUsecase<PinModel, PinUseCaseModel> {
  final HomeRepository repository;

  FetchPinDataUseCase(this.repository);
  @override
  @override
  Future<Either<HttpError, PinModel>> call(
    PinUseCaseModel params,
  ) {
    return repository.getPin(postcode: params.pinCode);
  }
}

class PinUseCaseModel extends Params {
  String pinCode;
  PinUseCaseModel({required this.pinCode});

  factory PinUseCaseModel.fromJson(Map<String, dynamic> json) {
    return PinUseCaseModel(pinCode: json['pinCode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pinCode'] = pinCode;
    return data;
  }
}
