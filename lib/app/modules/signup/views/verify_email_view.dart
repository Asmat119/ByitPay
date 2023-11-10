import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/signup/controllers/signup_controller.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class VerifyEmailView extends GetView<SignupController> {
  const VerifyEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(backPress: () {  Get.back();},),
      body:  LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.minHeight),
                  child: IntrinsicHeight(
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),


                          SvgPicture.asset(MyAssets.notifySVG),
                        const CustomText(text: "Verify your email address", fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold,),
                        const SizedBox(height: 42,),
                        const CustomText(text: "In order to complete your registration and start using Bylt Pay, you need to verify your account.",
                          fontSize: 15, color: Colors.black,),
                        const SizedBox(height: 33,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PrimaryButton(title: "Verify email address",onPress: (){

                            controller.textEditingController.text = "";
                            controller.passwordEditingController.value.text = "";
                            controller.emailEditingController.value.text = "";
                            controller.aptEditingController.value.text = "";
                            controller.streetEditingController.value.text = "";
                            controller.taxEditingController.value.text = "";
                            controller.dOBEditingController.value.text = "";
                            controller.lNEditingController.value.text = "";

                            Get.toNamed(Routes.PERSONAL_VERIFICATION_IDENTITY);
                          },
                          fontWeight: FontWeight.w600,

                          ),
                        ),

                        TextButton(onPressed: (){
                          Get.back();
                        }, child: const CustomText(text: "edit email", color:  activePin, fontSize: 18,
                          fontWeight: FontWeight.w600,
                         letterSpacing: -0.2,
                        )),
                        Spacer(),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
