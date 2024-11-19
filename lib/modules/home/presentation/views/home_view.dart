import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:zippopotamus/core/constants/string/home_string.dart';
import 'package:zippopotamus/modules/home/data/model/pin_model.dart';
import 'package:zippopotamus/modules/home/presentation/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(HomeStrings.home),
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                HomeStrings.enterPin,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKey,
                child: TextFormField(
                  autofocus: true,
                  controller: controller.pinCodeController.value,
                  textAlign: TextAlign.start,
                  onChanged: (String value) {},
                  enableInteractiveSelection: true,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please a pin some text';
                    }
                    if (value.isEmpty) {
                      return 'Please enter min 3 character';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    counterText: "",
                    isDense: true,
                    hintText: 'Enter Pin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.mediaQuery.size.width * 0.5,
              height: context.mediaQuery.size.width * 0.08,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.getPinData();
                  }
                },
                child: Text(
                  HomeStrings.submit,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.places.length,
                    itemBuilder: (context, index) {
                      Place place = controller.places[index]!;
                      return ListTile(
                        title: Text(place.placename),
                        subtitle: Text(place.state),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
