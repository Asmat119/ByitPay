import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupController extends GetxController {


  final TextEditingController textEditingController = TextEditingController();
  String initialCountry = 'NG';
  Rx<PhoneNumber> number = PhoneNumber(isoCode: 'NG').obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

      this.number.value = number;
  }


  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
