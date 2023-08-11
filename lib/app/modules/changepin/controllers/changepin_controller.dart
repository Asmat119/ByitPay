import 'package:get/get.dart';

class ChangepinController extends GetxController {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var inputText = "";
  var actives = [false, false, false, false].obs;
  var clears = [false, false, false, false].obs;
  var value = [1, 2, 3, 2];
  var currentIndex = 0.obs;
  RxInt status = 0.obs;

  List<String> titleList =
      ["Change Pin", "Create New Pin", "Confirm  New Pin"].obs;
  List<String> messageList = [
    "Please enter your current pin in order to make changes",
    "Create a 4 digit code to secure and access your account easily. ",
    "Confirm your 4 digit code to secure and access your account easily. "
  ].obs;

  final count = 0.obs;

  void setStatus(int value) => status.value = value;

  void increment() => count.value++;
}
