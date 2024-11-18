import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    pinCodeController.value.dispose();
    super.onClose();
  }
}
