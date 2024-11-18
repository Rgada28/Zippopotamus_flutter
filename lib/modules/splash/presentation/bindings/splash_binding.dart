import 'package:get/get.dart';
import 'package:zippopotamus/modules/splash/presentation/controllers/splash_controller.dart';

class SplashViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
