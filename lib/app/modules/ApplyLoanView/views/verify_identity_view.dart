import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryText(title: "Verification 📑", subTitle: ""),
                    CustomText(
                      text: MyConstants.verificationInfo,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: MyConstants.verificationInfoPointOne,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: MyConstants.verificationInfoPointTwo,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: MyConstants.verificationInfoPointThree,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),

                    Container(

                     margin: EdgeInsets.only(top: 51),
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: const Color(0XFFF1F3FA)),
                      child: Column(
                        children: [
                          Text(
                            "Upload Text",
                            style: GoogleFonts.dmSans(
                                letterSpacing: -0.8,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Please click on the  +  sign to upload your documents. ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(
                                  letterSpacing: -0.3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(MyAssets.done),
                              const SizedBox(
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
            ),

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
