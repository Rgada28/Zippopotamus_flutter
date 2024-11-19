import 'package:zippopotamus/core/network/home_dio.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';

abstract class HomeApi {
  Future<PinModel> getPinInfo(String postcode);
}

class HomeApiImpl with HomeDio implements HomeApi {
  @override
  Future<PinModel> getPinInfo(String postcode) async {
    final dio = await getDio();
    final response = await dio.get('in/$postcode');
    PinModel pinModel = PinModel.fromMap(response.data);
    return pinModel;
  }
}
