import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/loan_purpose_view.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EmploymentStatusView extends GetView<ApplyLoanViewController> {
  const EmploymentStatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () => Get.back()),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryText(title: "Employment Status 👨🏽‍💻", subTitle: ""),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                        text: "What is your current employment status?", fontSize: 13),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => CustomDropDown(
                          title: "",
                          item: controller.employeItems,
                          selectedOption: controller.emplyeSelectedOption.value,
                          onchange: (String? value) {
                            controller.emplyeSelectedOption.value = value!;
                          },
                          label: false,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomText(
                        text: "How long have you been working there? ", fontSize: 13),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => CustomDropDown(
                          title: "Duration",
                          item: controller.durationItems,
                          selectedOption: controller.durationSelectedOption.value,
                          onchange: (String? value) {
                            controller.durationSelectedOption.value = value!;
                          },
                          label: true,
                        )),
                  ],
                ),
              ),
            ),

            PrimaryButton(
                title: "Next",
                onPress: () {
                  Get.toNamed(Routes.SALARY);
                }),
          ],
        ),
      ),
    );
  }
}
