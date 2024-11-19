import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
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
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    )),
                child: Row(children: [
                  CountryPickerDropdown(
                    isDense: true,
                    isExpanded: false,
                    initialValue: 'IN',
                    itemBuilder: (Country country) => Row(
                      children: <Widget>[
                        CountryPickerUtils.getDefaultFlagImage(country),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text("+${country.phoneCode}(${country.isoCode})"),
                      ],
                    ),
                    onValuePicked: (Country country) {
                      controller.selectedCountryCode.value = country.isoCode;
                      // log(country.isoCode);
                    },
                  ),
                  Flexible(
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
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          counterText: "",
                          isDense: true,
                          hintText: 'Enter Pin',
                        ),
                      ),
                    ),
                  ),
                ]),
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
