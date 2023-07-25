import 'package:get/get.dart';

import '../controllers/apply_loan_view_controller.dart';

class ApplyLoanViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplyLoanViewController>(
      () => ApplyLoanViewController(),
    );
  }
}
