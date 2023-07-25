import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        backPress: () {
          print("click");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryText(
              title: 'Welcome back 👋🏽',
              subTitle:
                  "Please login to your account using the registered email and password.",
            ),
            const SizedBox(
              height: 12,
            ),
            EditTextField(
              controller: controller.textEditingController,
              suffixIcon: MyAssets.cancle,
              isSecure: false,
              lable: "Email",
            ),
            const SizedBox(
              height: 12,
            ),
            EditTextField(
              controller: controller.passEditingController,
              suffixIcon: MyAssets.lock,
              isSecure: false,
              lable: "Password",
            ),
          ],
        ),
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  const EditTextField(
      {super.key,
      required this.lable,
      required this.suffixIcon,
      required this.controller,
      required this.isSecure,
      this.showSuffixIcon = true,
      this.showLabel = true,
      this.showBorder = true,
      this.showInputBorder = false});
  final String lable, suffixIcon;
  final TextEditingController controller;
  final bool isSecure;
  final bool? showSuffixIcon;
  final bool? showLabel;
  final bool? showBorder;
  final bool? showInputBorder;

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
        cursorColor: monochrome,
        obscureText: false,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        decoration: InputDecoration(
          labelText: showLabel == false ? null : lable,
          suffixIconConstraints:
              const BoxConstraints(maxWidth: 20, maxHeight: 20),
          suffixIcon:
              showSuffixIcon == false ? null : SvgPicture.asset(suffixIcon),
          isDense: true,
          alignLabelWithHint: false,
          focusedBorder: showInputBorder == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: lightText, width: 0.7))
              : InputBorder.none,
          border: showInputBorder == true
              ? UnderlineInputBorder(
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
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.backPress,
  });
  @override
  final Callback backPress;
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
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
