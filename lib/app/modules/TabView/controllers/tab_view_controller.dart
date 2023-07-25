import 'package:get/get.dart';

class TabViewController extends GetxController {
  //TODO: Implement TabViewController

  RxInt currentIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTabTapped(int index) {
    currentIndex.value = index;
  }

  void increment() => count.value++;
}
