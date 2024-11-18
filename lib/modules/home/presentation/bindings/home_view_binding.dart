import 'package:get/get.dart';
import 'package:zippopotamus/modules/home/presentation/controllers/home_controller.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
