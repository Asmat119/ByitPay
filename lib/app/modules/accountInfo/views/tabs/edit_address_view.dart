import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/controllers/account_info_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/makepayment/views/makepayment_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditAddressView extends GetView<AccountInfoController> {
  const EditAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 36),
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CustomText(
                        text: "Street Address",
                        fontSize: 16,
                        textAlign: TextAlign.left,
                        color: lightGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    EditTextField(
                      controller: controller.addressEditingController,
                      isSecure: false,
                      showLabel: false,
                      fontWeight: FontWeight.w600,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CustomText(
                        text: "City",
                        fontSize: 16,
                        textAlign: TextAlign.left,
                        color: lightGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    EditTextField(
                      controller: controller.cityEditingController,
                      isSecure: false,
                      showLabel: false,
                      fontWeight: FontWeight.w600,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CustomText(
                        text: "Parish",
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CustomText(
                        text: "Country",
                        fontSize: 16,
                        textAlign: TextAlign.left,
                        color: lightGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    EditTextField(
                      controller: controller.countryEditingController,
                      isSecure: false,
                      showLabel: false,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),

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
