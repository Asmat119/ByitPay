import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/controllers/account_info_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactInfoView extends GetView<AccountInfoController> {
  const ContactInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 36),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: CustomText(
                      text: "Phone number",
                      fontSize: 16,
                      textAlign: TextAlign.left,
                      color: lightGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  EditTextField(
                    controller: controller.phoneNumberEditingController,
                    isSecure: false,
                    showLabel: false,
                    fontWeight: FontWeight.w600,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: CustomText(
                      text: "Email",
                      fontSize: 16,
                      textAlign: TextAlign.left,
                      color: lightGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  EditTextField(
                    controller: controller.emaileEditingController,
                    isSecure: false,
                    showLabel: false,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
              child: PrimaryButton(
                title: "Save",
                onPress: () {},
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
