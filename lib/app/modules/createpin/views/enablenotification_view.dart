import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/createpin/controllers/createpin_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class EnablenotificationView extends GetView<CreatepinController> {
  const EnablenotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () {
        Get.back();
      }),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => CustomText(
                  text: controller.heading.value,
                  fontSize: 28,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 7,
            ),
            Obx(() => CustomText(
                  textAlign: TextAlign.left,
                  text: controller.message.value,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 72,
            ),
            SizedBox(
                height: 200,
                child: Center(
                    child:
                        Obx(() => SvgPicture.asset(controller.image.value)))),
            const SizedBox(
              height: 120,
            ),
            Center(
                child: Obx(() => PrimaryButton(
                    fontWeight: FontWeight.w600,
                    title: controller.btntext.value,
                    onPress: () {
                      controller.isFlag.value = !controller.isFlag.value;
                      controller.setText(controller.isFlag.value);
                    }))),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: "Not now",
                    fontSize: 15,
                    letterSpacing: -0.2,
                    color: activePin,
                    fontWeight: FontWeight.w600,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
