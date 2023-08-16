import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../TabView/views/HomeTab/home_tab_view.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  VerificationView({Key? key}) : super(key: key);
  final String path = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(backPress: () {
          Get.back();
        }),
        backgroundColor: white,
        body: LayoutBuilder(builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.all(29.0),
            child:
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraint.maxHeight - 80),
                child: IntrinsicHeight(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PrimaryText(
                            title: "Verification ",
                            subTitle:
                            "Please enter the 4-digit code just sent to\n+1 (876) 123-4567"),


                        const SizedBox(height: 33,),
                        Obx(() {
                          return OtpTextField(
                            numberOfFields: 4,
                            fieldWidth: 60,

                            borderRadius: BorderRadius.circular(8),
                            focusedBorderColor: activePin,
                            disabledBorderColor: Colors.white,
                            fillColor: buttonDisbaleColor,
                            filled: true,
                            borderWidth: 1,
                            textStyle: GoogleFonts.inter(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),

                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            cursorColor: Colors.black,

                            //runs when a code is typed in
                            clearText: controller.clearText.value,
                            onCodeChanged: (String code) {
                              controller.isSubmit.value = false;
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.isSubmit.value = true;
                              // showDialog(
                              //     context: context,
                              //     builder: (context){
                              //       return AlertDialog(
                              //         title: const Text("Verification Code"),
                              //         content: Text('Code entered is $verificationCode'),
                              //       );
                              //     }
                              // );
                            }, // end onSubmit
                          );
                        }),
                        SizedBox(height: 26,),
                        const Center(
                          child: CustomText(
                            text: "Incorrect code enter",
                            fontSize: 16,
                            color: activePin,
                            letterSpacing: -0.4,
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                        Spacer(),
                        const Center(
                          child: CustomText(
                            text: "Resend code in 00:56",
                            fontSize: 16,
                            color: activePin,
                            letterSpacing: -0.4,
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(() {
                            return IgnorePointer(
                              ignoring: controller.isSubmit.value
                                  ? false
                                  : true,
                              child: PrimaryButton(
                                title: "Verify",
                                onPress: () {
                                  controller.clearText.value = true;
                                  if (path == 'tab') {
                                    Get.toNamed(Routes.TAB_VIEW);
                                  }
                                  else {
                                    Get.toNamed(Routes.PERSONALSIGNUP);
                                  }
                                },
                                fontWeight: FontWeight.w600,
                                color: controller.isSubmit.value
                                    ? primaryColor
                                    : buttonDisbaleColor,
                                textColor: controller.isSubmit.value ? Colors
                                    .white : lightGrey,

                              ),
                            );
                          }),
                        )


                      ]),
                ),
              ),
            ),
          );
        })
    );
  }
}
