import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: CustomAppBar(
        text: "",
        backPress: () {
          debugPrint("click");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryText(
                    title: 'Welcome back 👋🏽',
                    subTitle:
                        "Please login to your account using the registered email and password.",
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  EditTextField(
                    controller: controller.textEditingController.value,
                    suffixIcon: MyAssets.cancle,
                    isSecure: false,
                    lable: "Email",
                    onChange: (value) {
                      debugPrint(value);
                      controller.emaiText.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  EditTextField(
                    controller: controller.passEditingController.value,
                    suffixIcon: MyAssets.lock,
                    isSecure: false,
                    lable: "Password",
                    onChange: (value) {
                      controller.passwordText.value = value;
                    },
                  ),
                  const SizedBox(height: 29),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33),
                    child: CustomText(
                      text: "Email address not associated with an account",
                      fontSize: 15,
                      color: activePin,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'By using our mobile app, you agree to our',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 13)),
                    TextSpan(
                        text: ' Terms of Use',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: activePin,
                            fontSize: 13)),
                    TextSpan(
                        text: ' and ',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 13)),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: activePin,
                            fontSize: 13)),
                  ],
                ),
              ),
            ),
            Obx(() => PrimaryButton(
                  title: "Login",
                  onPress: () {
                    if (controller.emaiText.value.isNotEmpty &&
                        controller.passwordText.value.isNotEmpty) {
                      Get.toNamed(Routes.TAB_VIEW);
                    } else {}
                  },
                  color: controller.emaiText.value.isNotEmpty &&
                          controller.passwordText.value.isNotEmpty
                      ? primaryColor
                      : buttonDisbaleColor,
                  textColor: controller.emaiText.value.isNotEmpty &&
                          controller.passwordText.value.isNotEmpty
                      ? Colors.white
                      : disbaleColor,
                )),
            const SizedBox(
              height: 19,
            ),
            InkWell(
              onTap: () {},
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Don’t have an account? ',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 13)),
                    TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: activePin,
                            fontSize: 13)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  const EditTextField(
      {super.key,
      this.lable,
      this.suffixIcon,
      required this.controller,
      required this.isSecure,
      this.showSuffixIcon = true,
      this.showLabel = true,
      this.showBorder = true,
      this.onChange,
      this.showInputBorder = false,
      this.hintText,
      this.fontWeight,
      this.letterSpace,
      this.textInputType});
  final String? lable, suffixIcon;
  final TextEditingController controller;
  final bool isSecure;
  final bool? showSuffixIcon;
  final bool? showLabel;
  final bool? showBorder;
  final bool? showInputBorder;
  final ValueChanged<String>? onChange;
  final String? hintText;
  final FontWeight? fontWeight;
  final double? letterSpace;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: showBorder == false
              ? null
              : Border.all(color: primaryColor.withOpacity(0.07))),
      child: TextFormField(
        controller: controller,
        cursorColor: monochrome,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: false,
        onChanged: onChange,
        style: GoogleFonts.inter(
            fontSize: 16,
            letterSpacing: letterSpace ?? 0.0,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: Colors.black),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, color: lightGrey),
          hintText: hintText ?? "",
          labelText: showLabel == false ? null : lable ?? "",
          suffixIconConstraints:
              const BoxConstraints(maxWidth: 20, maxHeight: 20),
          suffixIcon: showSuffixIcon == false
              ? null
              : SvgPicture.asset(suffixIcon ?? ""),
          isDense: true,
          alignLabelWithHint: false,
          focusedBorder: showInputBorder == true
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: lightText, width: 0.7))
              : InputBorder.none,
          border: showInputBorder == true
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: lightText, width: 0.7))
              : InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
              color: grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          subTitle,
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.backPress, this.text = ""});

  final Callback backPress;
  final String? text;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: CustomText(
        text: text ?? "",
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      leading: IconButton(
          onPressed: backPress,
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: monochrome,
          )),
      elevation: 0,
      backgroundColor: white,
    );
  }
}
