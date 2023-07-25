import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
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
      appBar: CustomAppBar(backPress: () {
        Get.back();
      }),
      body: Padding(
        padding: EdgeInsets.all(27.0),
        child: Column(
          children: [
            const PrimaryText(
                title: "Personal Info",
                subTitle:
                    "We have pre-filled your information from your account. Please take a moment to ensure all of the information below is correct."),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: controller.itemList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: CustomText(
                        text: controller.itemList[index].title,
                        fontSize: 14,
                        color: lightText,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: CustomText(
                        text: controller.itemList[index].subTitle,
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                      trailing: ElevatedButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return states.contains(MaterialState.pressed)
                                    ? grey.withOpacity(0.5)
                                    : null;
                              },
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                primaryColor.withOpacity(0.04)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)))),
                        onPressed: () {
                          print("object");
                        },
                        child: CustomText(
                          text: "Edit",
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        // Add your onTap logic here
                        print('Tapped on ${"hazra"}');
                      },
                    ),
                  );
                },
              ),
            ),
            Spacer(),
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
      required this.onPress});
  final String title;
  final Color color;
  final Color textColor;
  final Callback onPress;

  @override
  Widget build(BuildContext context) {
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
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
