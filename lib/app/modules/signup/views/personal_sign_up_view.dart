import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/loan_overview_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/loan_purpose_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/signup/controllers/signup_controller.dart';
import 'package:byitpay/app/modules/signup/views/signup_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PersonalSignUpView extends GetView<SignupController> {
  const PersonalSignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 10, right: 33, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: primaryColor.withOpacity(0.05)),
            child: Center(
                child: Obx(() {
                  return CustomText(
                    text: "Step ${controller.stepsCount.value} of 5",
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  );
                })),
          )
        ],
        leading: IconButton(
            onPressed: () {
              if(controller.stepsCount.value == 1){
                Get.back();

              }
              else{
              controller.stepsCount.value--;

              }
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: monochrome,
            )),
        elevation: 0,
        backgroundColor: white,
      ),
      body: LayoutBuilder(

          builder: (context, constraint) {
            return Padding(
              padding: const EdgeInsets.all(27.0),
              child: SingleChildScrollView(
                child: Obx(() {
                  return Column(
                    children: [
                       PrimaryText(
                          title: controller.titleText.value,
                          subTitle:
                          controller.msgText.value),
                      const SizedBox(
                        height: 36,
                      ),
                      controller.stepsCount.value == 1 ? StepOneWidget(
                          controller: controller, constraint: constraint) :
                      controller.stepsCount.value == 2 ?
                      StepTwoWidget(
                          controller: controller, constraint: constraint)
                          :    controller.stepsCount.value == 3 ? StepThreeWidget(controller: controller, constraint: constraint)
                          :  controller.stepsCount.value == 4 ? StepFourWidget(controller: controller, constraint: constraint): StepFiveWidget(controller: controller, constraint: constraint),
                    ],
                  );
                }),
              ),
            );
          }
      ),
    );
  }
}

class StepOneWidget extends StatelessWidget {
  const StepOneWidget({
    super.key,
    required this.controller,
    required this.constraint
  });

  final SignupController controller;
  final BoxConstraints constraint;


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: constraint.maxHeight - 180),
      child: IntrinsicHeight(
        child: Column(
          children: [

            Obx(() {
              return EditTextField(
                controller: controller.fNEditingController.value,
                isSecure: false,
                showSuffixIcon:     controller.fNameText.value.isNotEmpty ? true : false,
                onSuffixClick: (){
                  controller.fNEditingController.value.text = "";
                  controller.fNameText.value = "";
                },
                suffixIcon: MyAssets.cancle,
                onChange: (value) {
                  controller.fNameText.value = value;
                },
                showLabel: true,
                lable: "First name",
              );
            }),

            const SizedBox(
              height: 14,
            ),
            Obx(() {
              return EditTextField(
                controller: controller.lNEditingController.value,

                showSuffixIcon:     controller.lNameText.value.isNotEmpty ? true : false,
                onSuffixClick: (){
                  controller.lNEditingController.value.text = "";
                  controller.lNameText.value = "";
                },
                suffixIcon: MyAssets.cancle,
                isSecure: false,
                onChange: (value) {
                  controller.lNameText.value = value;
                },
                showLabel: true,
                lable: "Last name",
              );
            }),
            const SizedBox(
              height: 14,
            ),
            Obx(() {
              return EditTextField(
                controller: controller.dOBEditingController.value,
                isSecure: false,
                showSuffixIcon:     controller.dobText.value.isNotEmpty ? true : false,
                onSuffixClick: (){
                  controller.dOBEditingController.value.text = "";
                  controller.dobText.value = "";
                },
                suffixIcon: MyAssets.cancle,
                onChange: (value) {
                  controller.dobText.value = value;
                },
                showLabel: true,
                lable: "Date of birth ( MM / DD / YYYY)",
                textInputType: TextInputType.datetime,
              );
            }),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: CustomRichText(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return IgnorePointer(
                  ignoring: controller.stepOneValid() ? false : true,
                  child: PrimaryButton(
                    title: "Continue",
                    onPress: () {
                      controller.incrementStep();
                      // controller.lNEditingController.value.text = "";
                      // controller.fNEditingController.value.text = "";
                      // controller.dOBEditingController.value.text = "";
                      //
                      // controller.lNameText.value = "";
                      // controller.fNameText.value = "";
                      // controller.dobText.value = "";
                    },
                    fontWeight: FontWeight.w600,
                    color: controller.stepOneValid()
                        ? primaryColor
                        : buttonDisbaleColor,
                    textColor: controller.stepOneValid()
                        ? white
                        : lightGrey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class StepTwoWidget extends StatelessWidget {
  const StepTwoWidget({
    super.key,
    required this.controller,
    required this.constraint
  });

  final SignupController controller;
  final BoxConstraints constraint;


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: constraint.maxHeight - 180),
      child: IntrinsicHeight(
        child: Column(
          children: [

            Obx(() {
              return EditTextField(
                controller: controller.streetEditingController.value,
                isSecure: false,
                onChange: (value) {
                  controller.streetText.value = value;
                },
                showLabel: true,
                lable: "Street Address",
              );
            }),

            const SizedBox(
              height: 14,
            ),
            Obx(() {
              return EditTextField(
                controller: controller.aptEditingController.value,
                isSecure: false,

                onChange: (value) {
                  controller.aptText.value = value;
                },
                showLabel: true,
                lable: "Apt / Suite number",
              );
            }),
            const SizedBox(
              height: 14,
            ),
            Obx(() {
              return EditTextField(
                controller: controller.cityEditingController.value,
                isSecure: false,
                onChange: (value) {
                  controller.cityText.value = value;
                },
                showLabel: true,
                lable: "City",

              );
            }),
            const SizedBox(
              height: 14,
            ),

            Obx(() => CustomDropDown(
              title: "",
              item: controller.parishItems,
              selectedOption:
              controller.parishValue.value,
              onchange: (String? value) {
                controller.parishValue.value = value!;
              },

              label: true,
              labelText: const CustomText(text: "Parish",  color: grey, fontSize: 11, fontWeight: FontWeight.w500),
            )),
            const SizedBox(
              height: 14,
            ),
            Obx(() => CustomDropDown(
              title: "",
              item: controller.countryItems,
              selectedOption:
              controller.countryValue.value,
              onchange: (String? value) {
                controller.countryValue.value = value!;
              },

              label: true,
              labelText: const CustomText(text: "Country",  color: grey, fontSize: 11, fontWeight: FontWeight.w500),
            )),


            const Spacer(),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return IgnorePointer(
                  ignoring: controller.stepTwoValid() ? false : true,
                  child: PrimaryButton(
                    title: "Continue",
                    onPress: () {
                      controller.incrementStep();
                      // controller.streetEditingController.value.text = "";
                      // controller.aptEditingController.value.text = "";
                      // controller.cityEditingController.value.text = "";
                      //
                      // controller.streetText.value = "";
                      // controller.aptText.value = "";
                      // controller.cityText.value = "";
                    },
                    fontWeight: FontWeight.w600,
                    color: controller.stepTwoValid()
                        ? primaryColor
                        : buttonDisbaleColor,
                    textColor: controller.stepTwoValid()
                        ? white
                        : lightGrey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class StepThreeWidget extends StatelessWidget {
  const StepThreeWidget({
    super.key,
    required this.controller,
    required this.constraint
  });
  final SignupController controller;
  final BoxConstraints constraint;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: constraint.maxHeight - 180),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                controller.confirmLoanList.length,
                    (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTileWithEditButton(
                      title: controller.confirmLoanList[index].title,
                      subTitle: controller.confirmLoanList[index].subTitle,
                      onTab: (){
                        if(index==0  || index == 1){

                          controller.stepsCount.value--;
                          controller.stepsCount.value--;


                        }
                        if(index==2){
                          controller.stepsCount.value--;
                        }
                      },
                    ),
                    index <= 1 ? const Divider() : const Text(""),
                  ],
                ),
              ),
            ),
            const Spacer(),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                 PrimaryButton(
                  title: "Continue",
                  onPress: () {
                    controller.incrementStep();
                    // controller.taxEditingController.value.text = "";
                    // controller.taxText.value = "";
                  },
                  fontWeight: FontWeight.w600,
                   color: primaryColor
                ),
            )

          ],
        ),
      ),
    );
  }
}

class StepFourWidget extends StatelessWidget {
  const StepFourWidget({
    super.key,
    required this.controller,
    required this.constraint
  });

  final SignupController controller;
  final BoxConstraints constraint;


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: constraint.maxHeight - 180),
      child: IntrinsicHeight(
        child: Column(
          children: [

            Obx(() {
              return EditTextField(
                controller: controller.taxEditingController.value,
                isSecure: true,
                showSuffixIcon: true,
                suffixIcon: MyAssets.lock,
                textInputType: TextInputType.number,

                onChange: (value) {
                  controller.taxText.value = value;
                },
                showLabel: true,
                lable: "Tax Payer Number (TRN)",

              );
            }),
            const Spacer(),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return IgnorePointer(
                  ignoring: controller.stepFourValid() ? false : true,
                  child: PrimaryButton(
                      title: "Continue",
                      onPress: () {
                        controller.incrementStep();
                        // controller.taxEditingController.value.text = "";
                        // controller.taxText.value = "";

                      },
                      fontWeight: FontWeight.w600,
                    color: controller.stepFourValid()
                        ? primaryColor
                        : buttonDisbaleColor,
                    textColor: controller.stepFourValid()
                        ? white
                        : lightGrey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class StepFiveWidget extends StatelessWidget {
  const StepFiveWidget({
    super.key,
    required this.controller,
    required this.constraint
  });
  final SignupController controller;
  final BoxConstraints constraint;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: constraint.maxHeight - 180),
      child: IntrinsicHeight(
        child: Column(
          children: [

            Obx(() {
              return EditTextField(
                controller: controller.emailEditingController.value,
                isSecure: false,
                textInputType: TextInputType.text,
                onChange: (value) {
                  controller.emailText.value = value;
                },
                showLabel: true,
                lable: "Email",

              );
            }),
           const SizedBox(height: 14),
            Obx(() {
              return EditTextField(
                controller: controller.passwordEditingController.value,
                isSecure: controller.isSecure.value,
                showSuffixIcon: true,
                suffixIcon: MyAssets.lock,
                textInputType: TextInputType.text,
                isShowHideIcon: true,
                onHideIconClick: (){
                  controller.isSecure.value = !controller.isSecure.value;
                },
                onChange: (value) {
                  controller.passText.value = value;
                },
                showLabel: true,
                lable: "Password",

              );
            }),
            const Spacer(),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return IgnorePointer(
                  ignoring: controller.stepFiveValid() ? false : true,
                  child: PrimaryButton(
                    title: "Continue",
                    onPress: () {


                      // controller.emailEditingController.value.text = "";
                      // controller.passwordEditingController.value.text = "";
                      // controller.passText.value = "";
                      // controller.emailText.value = "";
                      Get.toNamed(Routes.VERIFYEMAIL);

                    },
                    fontWeight: FontWeight.w600,
                    color: controller.stepFiveValid()
                        ? primaryColor
                        : buttonDisbaleColor,
                    textColor: controller.stepFiveValid()
                        ? white
                        : lightGrey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


