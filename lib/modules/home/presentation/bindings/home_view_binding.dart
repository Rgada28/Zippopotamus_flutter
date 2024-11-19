import 'package:get/get.dart';
import 'package:zippopotamus/modules/home/data/datasource/home_api.dart';
import 'package:zippopotamus/modules/home/data/repository/home_repo_impl.dart';
import 'package:zippopotamus/modules/home/domain/usecases/fetch_pin_data.dart';
import 'package:zippopotamus/modules/home/presentation/controllers/home_controller.dart';
import 'package:zippopotamus/utils/network_info.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchPinDataUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(
      () => HomeRepositoryImpl(
        Get.find<HomeApiImpl>(),
        Get.find<NetworkInfo>(),
      ),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<FetchPinDataUseCase>(),
      ),
    );
  }
}
