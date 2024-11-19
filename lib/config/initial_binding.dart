import 'package:get/get.dart';
import 'package:zippopotamus/modules/home/data/datasource/home_api.dart';
import 'package:zippopotamus/modules/home/data/repository/home_repo_impl.dart';
import 'package:zippopotamus/modules/splash/presentation/bindings/splash_binding.dart';
import 'package:zippopotamus/utils/network_info.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    /// Connectivity
    Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(),
      fenix: true,
    );

    Get.lazyPut<HomeApi>(() => HomeApiImpl(), fenix: true);

    Get.lazyPut(() => SplashViewBinding());
    Get.lazyPut<HomeRepositoryImpl>(
      () => HomeRepositoryImpl(
        Get.find(),
        Get.find(),
      ),
      fenix: true,
    );
  }
}
