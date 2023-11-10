import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../controllers/apply_loan_view_controller.dart';

class ApplyLoanViewView extends GetView<ApplyLoanViewController> {
  const ApplyLoanViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
          text: "",
          backPress: () {

             Get.back();
             statusBarDark();

          }),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const PrimaryText(
                        title: "Personal Info",
                        subTitle:
                            "We have pre-filled your information from your account. Please take a moment to ensure all of the information below is correct."),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        3,
                        growable: true,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              enabled: false,
                              contentPadding: const EdgeInsets.all(0),
                              title: CustomText(
                                text: controller.itemList[index].title,
                                fontSize: 14,
                                color: lightText,
                                textAlign: TextAlign.left,
                                letterSpacing: -0.16,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: CustomText(
                                text: controller.itemList[index].subTitle,
                                fontSize: 16,
                                color: Colors.black,
                                letterSpacing: -0.4,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.left,
                              ),
                              trailing: ElevatedButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        return states
                                                .contains(MaterialState.pressed)
                                            ? grey.withOpacity(0.5)
                                            : null;
                                      },
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryColor.withOpacity(0.04)),
                                    elevation: MaterialStateProperty.all(0),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)))),
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Edit",
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: () {
                                // Add your onTap logic here
                                debugPrint('Tapped on ${"hazra"}');
                              },
                            ),
                            index <= 1 ? const Divider() : const Text(""),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
                title: "Next", onPress: () => Get.toNamed(Routes.LOAN_PUPOSE))
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.title,
      this.color = primaryColor,
      this.textColor = white,
      required this.onPress,
      this.fontWeight});
  final String title;
  final Color color;
  final Color textColor;
  final Callback onPress;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    statusBarLight();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)))),
            onPressed: onPress,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: CustomText(
                text: title,
                fontSize: 17,
                color: textColor,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
