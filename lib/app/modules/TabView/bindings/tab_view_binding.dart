import 'package:get/get.dart';

import '../controllers/tab_view_controller.dart';

class TabViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabViewController>(
      () => TabViewController(),
    );
  }
}
