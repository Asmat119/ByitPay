import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/controllers/account_info_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NameChangeView extends GetView<AccountInfoController> {
  const NameChangeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.setTextFieldController();
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        backPress: () {
          if (controller.isSubmit.value) {
            controller.isSubmited(false);
          } else {
            Get.back();
          }
        },
        text: "Name change",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(23),
        child: Obx(() => Container(
            child: !controller.isSubmit.value
                ? UploadDocumentWidget(controller: controller)
                : const SubmittedNameChange(
                    message: MyConstants.weWill,
                  ))),
      ),
    );
  }
}

class SubmittedNameChange extends StatelessWidget {
  const SubmittedNameChange({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 71,
        ),
        Center(child: SvgPicture.asset(MyAssets.submitVector)),
        const CustomText(
          text: "Thanks! We recieve your request to update your name",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 71,
        ),
        CustomText(
          text: message,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: monochrome,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 74),
          child: PrimaryButton(
            title: "Got it!!",
            onPress: () {},
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({
    super.key,
    required this.controller,
  });

  final AccountInfoController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text:
              "Please enter your updated name below and additional supporting documents to verify your name. ",
          fontSize: 15,
          letterSpacing: -0.2,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 28,
        ),
        EditTextField(
          controller: controller.fullNameEditingController,
          isSecure: false,
          showLabel: true,
          lable: "Full name",
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: DocumentCard(
            heading: "Government ID",
            message:
                "Take a driver’s license,national identity card or passport photo",
            isShowText: false,
            iconColor: green,
            iconPath: MyAssets.greenTick,
          ),
        ),
        Center(
          child: DocumentCard(
            heading: "Proof of change",
            message: "Please uplaod documents to verify name change.",
            isShowText: true,
            iconColor: darkBlue,
            iconPath: MyAssets.bluePlus,
          ),
        ),
        const SizedBox(
          height: 33,
        ),
        PrimaryButton(
          title: "Continue",
          onPress: () {
            controller.isSubmited(true);
          },
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}

class DocumentCard extends StatelessWidget {
  const DocumentCard({
    super.key,
    required this.heading,
    required this.message,
    required this.isShowText,
    required this.iconColor,
    required this.iconPath,
  });
  final String heading, message, iconPath;
  final bool isShowText;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0XFFF1F3FA),
          borderRadius: BorderRadius.circular(33)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading,
            style: GoogleFonts.dmSans(
                fontSize: 24,
                letterSpacing: -0.8,
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
                fontSize: 14,
                color: darkBlue800.withOpacity(0.8),
                letterSpacing: -0.3,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 31),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                highlightElevation: 0,
                focusElevation: 0,
                backgroundColor: iconColor.withOpacity(0.1),
                child: SvgPicture.asset(
                  iconPath,
                ),
              ),
              isShowText
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Select",
                        style: GoogleFonts.dmSans(
                            fontSize: 18,
                            letterSpacing: -0.4,
                            color: darkBlue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
