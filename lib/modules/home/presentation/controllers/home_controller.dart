import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';
import 'package:zippopotamus/modules/home/domain/usecases/fetch_pin_data.dart';
import 'package:zippopotamus/utils/http_error.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  RxString selectedCountryCode = 'IN'.obs;
  final formKey = GlobalKey<FormState>();

  final FetchPinDataUseCase fetchPinData;

  RxList<Place?> places = <Place>[].obs;

  HomeController(this.fetchPinData);

  @override
  void onClose() {
    pinCodeController.value.dispose();
    super.onClose();
  }

  onSumbit() {
    getPinData();
  }

  getPinData() async {
    PinUseCaseModel pinUseCaseModel = PinUseCaseModel(
        pinCode: pinCodeController.value.text,
        country: selectedCountryCode.value);
    var response = await fetchPinData(pinUseCaseModel);
    response.fold((l) {
      if (l is AppError) {
        Get.closeAllSnackbars();
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          animationDuration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          title: 'Invalid Pin code',
          message: 'Please enter valid pin code',
        ));
      }
      if (l is NoInternetError) {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          animationDuration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          title: 'No Internet',
          message: 'Please check your internet connection',
        ));
      } else if (l is SlowInternetError) {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          animationDuration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          title: 'Slow Internet',
          message: 'Please check your internet connection',
        ));
      } else if (l is UnAuthorizedError) {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          animationDuration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          title: 'Something went wrong',
          message: 'Please try again later',
        ));
      }
      places.clear();
    }, (r) => places.value = r.places ?? []);
  }
}
