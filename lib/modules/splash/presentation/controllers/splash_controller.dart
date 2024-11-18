import 'dart:developer';

import 'package:get/get.dart';
import 'package:zippopotamus/config/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    log("on Splash screem");
    Future.delayed(const Duration(seconds: 2), () {
      log("navigating to Home");
      Get.offAndToNamed(Routes.homeView);
    });
  }
}
