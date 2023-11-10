import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/controllers/account_info_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/makepayment/views/makepayment_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PersonalInfoView extends GetView<AccountInfoController> {
  const PersonalInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.setTextFieldController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CustomText(
                text: "Your name",
                fontSize: 16,
                textAlign: TextAlign.left,
                color: lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            EditTextField(
              controller: controller.nameEditingController,
              isSecure: false,
              showLabel: false,
              hintText: "Andrea Plummer",
              fontWeight: FontWeight.w600,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CustomText(
                text: "Occupation",
                fontSize: 16,
                textAlign: TextAlign.left,
                color: lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            EditTextField(
              controller: controller.occupationEditingController,
              isSecure: false,
              showLabel: false,
              fontWeight: FontWeight.w600,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CustomText(
                text: "Employee",
                fontSize: 16,
                textAlign: TextAlign.left,
                color: lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            EditTextField(
              controller: controller.employeeEditingController,
              isSecure: false,
              showLabel: false,
              fontWeight: FontWeight.w600,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CustomText(
                text: "Gender",
                fontSize: 16,
                textAlign: TextAlign.left,
                color: lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            Obx(() => CustomDropDownWithoutHeading(
                value: controller.selectedValue.value,
                list: controller.dropdowList,
                onchange: (value) {
                  controller.selectedValue.value = value!;
                })),
            Center(
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.NAMECHNAGE);
                  },
                  child: const CustomText(
                    text: "Request name change",
                    fontSize: 16,
                    color: activePin,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
              child: PrimaryButton(
                title: "Save",
                onPress: () {},
                fontWeight: FontWeight.w600,
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.CLOSEACCOUNT);
                  },
                  child: const CustomText(
                    text: "Close my account",
                    fontSize: 16,
                    color: activePin,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
