import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyIdentityView extends GetView {
  const VerifyIdentityView({Key? key}) : super(key: key);
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(title: "Verification 📑", subTitle: ""),
                  CustomText(
                    text: MyConstants.verificationInfo,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: MyConstants.verificationInfoPointOne,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: MyConstants.verificationInfoPointTwo,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: MyConstants.verificationInfoPointThree,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Color(0XFFF1F3FA)),
                    child: Column(
                      children: [
                        Text(
                          "Upload Text",
                          style: GoogleFonts.dmSans(
                              letterSpacing: -0.1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Please click on the  +  sign to upload your documents. ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                              letterSpacing: -0.1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyAssets.done),
                            SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: "Select",
                              fontSize: 16,
                              color: darkBlue,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
                title: "Continue",
                onPress: () {
                  Get.toNamed(Routes.LOANOVERVIEW);
                })
          ],
        ),
      ),
    );
  }
}
