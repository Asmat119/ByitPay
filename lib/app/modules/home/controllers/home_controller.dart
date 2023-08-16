import 'dart:ui';

import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

   Rx<Color> disableColor = const Color(0XFFF9FAFB).obs;
    RxBool  isLoginClick = true.obs;

  final count = 0.obs;

  void increment() => count.value++;
}
