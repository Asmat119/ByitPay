import 'package:get/get.dart';

import '../controllers/pincode_controller.dart';

class PincodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => PincodeController());
    Get.lazyPut<PincodeController>(
      () => PincodeController(),
    );
  }
}
