import 'package:byitpay/app/modules/changepin/controllers/changepin_controller.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:get/get.dart';

class CreatepinController extends GetxController {
  final ChangepinController changepinController =
      Get.put(ChangepinController());

  RxBool isFlag = false.obs;

  RxInt status = 0.obs;
  RxString heading = "Notify me".obs;
  RxString message =
      "Get notified about spending, remittances, bill payments, payment request and promotions, so you’re always in the know. "
          .obs;
  RxString btntext = "Allow Notification".obs;
  RxString image = MyAssets.notifySVG.obs;

  List<String> titleList =
      ["Create passcode", "Create passcode", "Confirm passcode"].obs;
  List<String> messageList = [
    "Please enter your current pin in order to make changes",
    "Create a 4 digit code to secure and access your account easily. ",
    "Confirm your 4 digit code to secure and access your account easily. "
  ].obs;

  void setStatus(int value) => status.value = value;

  void setText(bool flag) {
    if (flag) {
      btntext.value = "Allow Notification";
      heading.value = "Notify me";
      message.value =
          "Get notified about spending, remittances, bill payments, payment request and promotions, so you’re always in the know.";
      image.value = MyAssets.notifySVG;
    } else {
      btntext.value = "Allow Access";
      heading.value = "Find your friends";
      message.value =
          "Allow access to your contacts to send send and request money with your friends, split bills and top-up.";
      image.value = MyAssets.contacts;
    }
  }
}
