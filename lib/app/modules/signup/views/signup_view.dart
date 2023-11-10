import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(backPress: () {
          Get.back();
        }),
        backgroundColor: white,
        body: LayoutBuilder(builder: (context, constraint) {
          return Form(
            key: formKey,
            child: Padding(
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
                              title: "Let’s get started!",
                              subTitle:
                              "Please enter your phone number to create an account. "),
                          Container(
                            height: 56,
                            margin: const EdgeInsets.symmetric(vertical: 23),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 14),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(1, 1),
                                      color: Colors.black.withOpacity(0.03),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ]),
                            child: Row(children: [
                              SvgPicture.asset(MyAssets.jamcia),
                              const SizedBox(width: 8,),
                              const CustomText(text: "+1", fontSize: 17, fontWeight: FontWeight.w500,),

                               Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SizedBox(
                                    height: 34,

                                    child: VerticalDivider(color: Colors.black.withOpacity(0.23),),


                                ),
                              ),
                              Expanded(
                                child: EditTextField(controller: controller
                                    .textEditingController, isSecure: false,
                                  showBorder: false,
                                  textInputType: TextInputType.number,

                                  showLabel:false,
                                  onChange: (value){
                                    controller.numberText.value = value;

                                  },

                                ),
                              )

                            ],),
                          ),
                          const Spacer(),
                          const CustomRichText(),
                          Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Obx(() {
                              return PrimaryButton(
                                title: 'Continue', onPress: () {
                                Get.toNamed(Routes.VERIFICATION, arguments: 'signup');
                              },
                                fontWeight: FontWeight.w600,
                                color: controller.numberText.value.isEmpty ? buttonDisbaleColor : primaryColor,
                                textColor: controller.numberText.value.isEmpty ? lightGrey : white,
                              );
                            }),
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(

                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                          'Already have an account?',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 13,

                                          )
                                      ),
                                      TextSpan(text: ' Login',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            color: activePin,
                                            fontSize: 13,

                                          )
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ]),
                  ),
                ),
              ),
            ),
          );
        })
    );
  }
}

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(

          children: <TextSpan>[
            TextSpan(
                text:
                'By selecting continue, you agree that you are 18 year and older to open an account and our',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 13,

                )
            ),
            TextSpan(text: ' Terms of Use!',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: activePin,
                  fontSize: 13,

                )
            ),
            TextSpan(
                text:
                ' and',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 13
                )
            ),
            TextSpan(text: ' Privacy Policy',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: activePin,
                    fontSize: 13
                )
            ),
          ],
        ),
      ),
    );
  }
}
