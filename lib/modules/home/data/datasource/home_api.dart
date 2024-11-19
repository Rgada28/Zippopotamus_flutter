import 'package:zippopotamus/core/network/home_dio.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';
import 'package:zippopotamus/modules/home/domain/usecases/fetch_pin_data.dart';

abstract class HomeApi {
  Future<PinModel> getPinInfo(PinUseCaseModel params);
}

class HomeApiImpl with HomeDio implements HomeApi {
  @override
  Future<PinModel> getPinInfo(PinUseCaseModel params) async {
    final dio = await getDio();
    final response = await dio.get('${params.country}/${params.pinCode}');
    PinModel pinModel = PinModel.fromMap(response.data);
    return pinModel;
  }
}
