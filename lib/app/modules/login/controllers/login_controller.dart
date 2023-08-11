import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  Rx<TextEditingController> passEditingController = TextEditingController().obs;
  RxString emaiText = "".obs;
  RxString passwordText = "".obs;
  final count = 0.obs;

  void increment() => count.value++;
}
