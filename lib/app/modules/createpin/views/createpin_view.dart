import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/changepin/views/changepin_view.dart';
import 'package:byitpay/app/modules/createpin/controllers/createpin_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreatepinView extends GetView<CreatepinController> {
  const CreatepinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        backPress: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 7, left: 24),
                child: Obx(() => CustomText(
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                    text: controller.titleList[controller.status.value],
                    fontSize: 28))),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomText(
                    textAlign: TextAlign.left,
                    text:
                        "Create a 4 digit code to secure and access your account easily. ",
                    fontSize: 15)),
            const SizedBox(
              height: 38,
            ),
            SizedBox(
              height: 360,
              child: PinCodeWidget(
                controller: controller.changepinController,
                onCountReached: (int count) {
                  controller.changepinController.count.value = count;
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: PrimaryButton(
                  title: "Continue",
                  onPress: () {
                    if (controller.changepinController.count >= 3) {
                      controller.changepinController.clears.value = controller
                          .changepinController.clears
                          .map((e) => true)
                          .toList();
                      controller.changepinController.actives.value = controller
                          .changepinController.actives
                          .map((e) => false)
                          .toList();
                      controller.changepinController.currentIndex.value = 0;
                      controller.changepinController.inputText = "";

                      if (controller.status.value <= 2) {
                        if (controller.status.value == 2) {
                          Get.toNamed(Routes.ENABLENOTIFICATION);
                        } else {
                          controller.status.value = controller.status.value + 1;

                          controller.setStatus(controller.status.value);
                        }
                      } else {
                        debugPrint("Compltede");
                      }
                    }
                  }),
            ),
            const SizedBox(
              height: 62,
            ),
          ],
        ),
      ),
    );

    // });
  }
}
