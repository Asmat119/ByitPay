import 'package:get/get.dart';

import '../controllers/changepin_controller.dart';

class ChangepinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangepinController>(
      () => ChangepinController(),
    );
  }
}
