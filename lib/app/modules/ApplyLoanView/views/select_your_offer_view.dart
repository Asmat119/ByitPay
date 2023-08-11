import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../constants/my_colors.dart';

class SelectYourOfferView extends GetView<ApplyLoanViewController> {
  const SelectYourOfferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const PrimaryText(
                          title: "Select your offer", subTitle: ""),
                      SvgPicture.asset(
                        "assets/icons/vector.svg",
                        height: 200,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      const CustomText(
                        text: "You’re pre-approved",
                        fontSize: 22,
                        letterSpacing: -0.2,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomText(
                          text: MyConstants.here,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      Obx(() => ListTile(
                            onTap: () {
                              controller.fourMonth.value = false;
                              controller.fiveMonth.value = true;
                            },
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: -1,
                            leading: SvgPicture.asset(controller.fiveMonth.value
                                ? MyAssets.radioCheck
                                : MyAssets.radioUncheck),
                            title: const CustomText(
                              text: "\$30,000 for 5 months",
                              fontSize: 16,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                            ),
                            subtitle: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You can borrow up to',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " \$30,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: " at",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " 9% ARP",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: " for",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " 4 months",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12)),
                                  TextSpan(
                                      text: " with a monthly payment of",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " \$6540",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => ListTile(
                            onTap: () {
                              controller.fourMonth.value = true;
                              controller.fiveMonth.value = false;
                            },
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: -1,
                            leading: SvgPicture.asset(controller.fourMonth.value
                                ? MyAssets.radioCheck
                                : MyAssets.radioUncheck),
                            title: const CustomText(
                              text: "\$30,000 for 4 months",
                              fontSize: 16,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                            ),
                            subtitle: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You can borrow up to',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " \$30,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: " at",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " 7% ARP",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: " for",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " 4 months",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12)),
                                  TextSpan(
                                      text: " with a monthly payment of",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: " \$8025",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              PrimaryButton(title: "Submit Application", onPress: () {}),
              TextButton(
                onPressed: () {},
                child: const CustomText(
                  text: "cancel",
                  fontSize: 16,
                  color: activePin,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
