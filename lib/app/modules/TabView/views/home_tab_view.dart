import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class HomeTabView extends GetView<TabViewController> {
  const HomeTabView({Key? key}) : super(key: key);
  final bool isFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(260.0), // here the desired height
          child: Container(
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(MyAssets.profile),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome,",
                              style: TextStyle(
                                  color: activePin,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 1),
                            Text(
                              "Andrea Plummer",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(MyAssets.chat))
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    padding:
                        const EdgeInsets.only(left: 18, bottom: 9, top: 18),
                    decoration: const BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        )),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Loan Balance",
                            style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "\$0 JMD",
                            style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeaderCustomButton(
                        name: "Apply",
                        iconPath: MyAssets.apply,
                        onTab: () {
                          print("ajajja");
                          Get.toNamed(Routes.APPLY_LOAN_VIEW);
                        },
                      ),
                      HeaderCustomButton(
                        name: "Pay",
                        iconPath: MyAssets.pay,
                        onTab: () {},
                      ),
                      HeaderCustomButton(
                        name: "Loan Details",
                        iconPath: MyAssets.details,
                        onTab: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 1)
              ], color: white, borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                Row(
                  children: [
                    CustomText(
                      text: "Payment History",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    const Spacer(),
                    CustomText(
                      text: "View All",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: lightPurple,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                isFlag
                    ? Row(
                        children: [
                          SvgPicture.asset(MyAssets.clock),
                          const SizedBox(
                            width: 12,
                          ),
                          CustomText(
                            text: "No transaction yet",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: grey.withOpacity(0.5),
                          ),
                        ],
                      )
                    : Column(
                        children:
                            List.generate(10, (index) => PaymentHistoryCard()),
                      )
              ]),
            ),
            const SizedBox(height: 12),
            Container(
              constraints: const BoxConstraints(minHeight: 150),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 1)
              ], color: white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Bylt Loan",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text:
                          "Short on cash? Borrow on your terms to cover unexpected emergency up to \$100,000.",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: grey.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CustomText(
                            text: "View rates",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: activePin,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                            color: activePin,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentHistoryCard extends StatelessWidget {
  const PaymentHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.7, color: Color(0XFFF8F8F8)),
        color: white,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0XFFF9FAFB),
              borderRadius: BorderRadius.circular(12)),
          child: SvgPicture.asset(
            MyAssets.loan,
            color: primaryColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Loan Pyament",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: grey.withOpacity(0.5),
            ),
            SizedBox(
              height: 3,
            ),
            CustomText(
              text: "Jan 15, 11:00 AM",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: grey.withOpacity(0.5),
            ),
          ],
        ),
        Spacer(),
        CustomText(
          text: "\$2750",
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ]),
    );
  }
}

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign = TextAlign.center});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: (fontWeight ?? FontWeight.w500),
          color: color ?? Colors.black),
    );
  }
}

class HeaderCustomButton extends StatelessWidget {
  const HeaderCustomButton({
    super.key,
    required this.name,
    required this.iconPath,
    required this.onTab,
  });
  final String name, iconPath;
  final Callback onTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTab,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white.withOpacity(0.07)),
                child: SvgPicture.asset(iconPath),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w400, color: white, fontSize: 14),
          )
        ],
      ),
    );
  }
}
