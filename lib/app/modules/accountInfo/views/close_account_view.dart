import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/controllers/account_info_controller.dart';
import 'package:byitpay/app/modules/accountInfo/views/name_change_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/makepayment/views/makepayment_view.dart';
import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CloseAccountView extends GetView<AccountInfoController> {
  const CloseAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        appBar: CustomAppBar(
          backPress: () {
            Get.back();
          },
          text: "Close account",
        ),
        body: Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
              child: SizedBox(
                  child: controller.isClose.value
                      ? const SingleChildScrollView(
                          child: SubmittedNameChange(
                          message: MyConstants.sorrytoseeyou,
                        ))
                      : CloseAccountWidget(controller: controller)),
            )));
  }
}

class CloseAccountWidget extends StatelessWidget {
  const CloseAccountWidget({
    super.key,
    required this.controller,
  });

  final AccountInfoController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                textAlign: TextAlign.left,
                text: MyConstants.sorry,
                fontSize: 15,
                color: Colors.black,
              ),
              const SizedBox(
                height: 22,
              ),
              const CustomText(
                textAlign: TextAlign.left,
                text: MyConstants.please,
                fontSize: 15,
                color: Colors.black,
              ),
              const SizedBox(
                height: 31,
              ),
              const CustomText(
                text: "Reason for Closure",
                fontSize: 16,
                textAlign: TextAlign.left,
                color: lightGrey,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 14,
              ),
              Obx(() => CustomDropDownWithoutHeading(
                  value: controller.selectedClosedropValue.value,
                  list: controller.closeAccountDropList,
                  onchange: (value) {
                    controller.selectedClosedropValue.value = value!;
                  })),
              const SizedBox(
                height: 22,
              ),
              EditTextField(
                controller: controller.lastDigitEditingController.value,
                isSecure: false,
                textInputType: TextInputType.number,
                showLabel: true,
                lable: "last 4 digit only",
                onChange: (value) {
                  controller.lastDigitTextValue.value = value;
                  // controller.lastDigitEditingController.value.text = value;
                },
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 27),
                  child: CustomText(
                    text: "Incorrect number entered",
                    fontSize: 16,
                    color: activePin,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Obx(
          () => IgnorePointer(
            ignoring:
                controller.lastDigitTextValue.value.isNotEmpty ? false : true,
            child: PrimaryButton(
              title: "Close account",
              fontWeight: FontWeight.w600,
              textColor: controller.lastDigitTextValue.value.isNotEmpty
                  ? white
                  : lightGrey,
              onPress: () {
                controller.isClose.value = true;
              },
              color: controller.lastDigitTextValue.value.isNotEmpty
                  ? primaryColor
                  : buttonDisbaleColor,
            ),
          ),
        )
      ],
    );
  }
}
