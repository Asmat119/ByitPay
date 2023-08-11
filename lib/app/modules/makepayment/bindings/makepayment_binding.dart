import 'package:get/get.dart';

import '../controllers/makepayment_controller.dart';

class MakepaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MakepaymentController>(
      () => MakepaymentController(),
    );
  }
}
