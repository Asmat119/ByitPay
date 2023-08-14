import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../controllers/signup_controller.dart';


class SignupView extends GetView<SignupController> {

   SignupView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () {}),
      body:   Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(29.0),
          child: Column(
            children: [
              const PrimaryText(
                  title: "Let’s get started!",
                  subTitle:
                      "Please enter your phone number to create an account. "),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: controller.number.value,
                textFieldController: controller.textEditingController,
                formatInput: true,
                keyboardType:
                const TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),

  ]
          ),



          ),
      ),

    );
  }
}
