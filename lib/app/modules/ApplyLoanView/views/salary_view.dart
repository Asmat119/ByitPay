import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SalaryView extends GetView<ApplyLoanViewController> {
  const SalaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () => Get.back()),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: PrimaryText(
                  title: "Salary  💸",
                  subTitle:
                      "How much do you make before taxes each year? Please enter the amount below: "),
            ),
            EditTextField(
              lable: "Gross Income",
              suffixIcon: MyAssets.forward,
              controller: controller.salryEditingController,
              isSecure: false,
              showSuffixIcon: true,
              showLabel: true,
              showBorder: false,
              showInputBorder: true,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: PrimaryButton(
                  title: "Next",
                  onPress: () {
                    Get.toNamed(Routes.REPAYMENT);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
