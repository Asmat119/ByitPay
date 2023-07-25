import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/loan_purpose_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RepaymentMethodView extends GetView<ApplyLoanViewController> {
  const RepaymentMethodView({Key? key}) : super(key: key);
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
            const PrimaryText(
                title: "Repayment Method ?",
                subTitle: "How do you prefer to repay your loan? "),
            SizedBox(
              height: 16,
            ),
            Obx(() => CustomDropDown(
                  title: "Salary Deduction",
                  item: controller.salaryDeductionItems,
                  selectedOption: controller.dedcutionSelectedOption.value,
                  onchange: (String? value) {
                    controller.dedcutionSelectedOption.value = value!;
                  },
                )),
            Spacer(),
            PrimaryButton(
                title: "Next",
                onPress: () {
                  Get.toNamed(Routes.VERIFYIDENTITY);
                })
          ],
        ),
      ),
    );
  }
}
