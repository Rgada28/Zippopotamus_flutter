import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:zippopotamus/modules/splash/presentation/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Container(
      height: context.mediaQuery.size.height,
      width: context.mediaQuery.size.width,
      color: Colors.black,
      child: const FlutterLogo(),
    );
  }
}
