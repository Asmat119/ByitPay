import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanDocumentView extends GetView<TabViewController> {
  const LoanDocumentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        backPress: () {
          Get.back();
        },
        text: "Loan Documents",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Column(children: [
            StatementListTile(
              title: "Loan Agreement",
              onTab: () {},
            ),
            StatementListTile(
              title: "Payoff Quote 01/27/2023",
              onTab: () {},
            )
          ]),
        ),
      ),
    );
  }
}

class StatementListTile extends StatelessWidget {
  const StatementListTile({
    super.key,
    required this.title,
    required this.onTab,
  });
  final String title;
  final Callback? onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 29, right: 43),
      child: Column(
        children: [
          Column(
            children: [
              InkWell(
                onTap: onTab,
                child: Row(
                  children: [
                    CustomTextPoppins(
                      text: title,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      MyAssets.rightArrow,
                      width: 20,
                      color: activePin,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextPoppins extends StatelessWidget {
  const CustomTextPoppins(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign = TextAlign.center,
      this.letterSpacing = 0});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          fontWeight: (fontWeight ?? FontWeight.w500),
          color: color ?? Colors.black),
    );
  }
}
