import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class HowMuchView extends GetView<ApplyLoanViewController> {
  const HowMuchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () {
        Get.back();
      }),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: PrimaryText(
                          title: "How much? 💰  ",
                          subTitle:
                              "Please enter your phone number to create an account. "),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EditTextField(
                      lable: "Years",
                      suffixIcon: MyAssets.forward,
                      controller: controller.loanAmountEditingController,
                      isSecure: false,
                      showSuffixIcon: true,
                      showLabel: true,
                      showBorder: false,
                      showInputBorder: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: CustomText(
                        text: "Enter an amount between \$5,000 and \$1000,000",
                        fontSize: 13,
                        color: grey,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    EditTextField(
                      lable: "Loan Term",
                      suffixIcon: MyAssets.forward,
                      controller: controller.amountEditingController,
                      isSecure: false,
                      showSuffixIcon: true,
                      showLabel: true,
                      showBorder: false,
                      showInputBorder: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    EditTextField(
                      lable: "Repayment Frequency",
                      suffixIcon: MyAssets.forward,
                      controller: controller.paymentAmountEditingController,
                      isSecure: false,
                      showSuffixIcon: true,
                      showLabel: true,
                      showBorder: false,
                      showInputBorder: true,
                    ),
                    Container(
                      margin: EdgeInsets.all(14),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0XFFECECEC).withOpacity(0.5),
                      ),
                      child:
                      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: SvgPicture.asset(
                            MyAssets.money,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Loan Pyament",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: lightPurple,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CustomText(
                              text: "\$5,500 to 5,800 / month",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Spacer(),
                      ]),
                    ),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomText(
                text:
                    "*This is just an estimation, your official payment won’t be selected until we review your application and credit. ",
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: PrimaryButton(
                  title: "Next",
                  onPress: () {
                    Get.toNamed(Routes.EMPLOYEMENT);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
