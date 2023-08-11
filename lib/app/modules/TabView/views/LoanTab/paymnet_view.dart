import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymnetView extends GetView<TabViewController> {
  const PaymnetView(this.model, {Key? key}) : super(key: key);
  final LoanModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const CustomText(
                    text: "Auto -Pay",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: linearRed,
                  ),
                  const Spacer(),
                  HighLightButton(
                    backgroundColor: activePin,
                    text: "Disabled",
                    onTab: () {},
                    textColor: activePin,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(),
              ),
              Row(
                children: [
                  const CustomText(
                    text: "Payment History",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  const Spacer(),
                  HighLightButton(
                    backgroundColor: green,
                    text: "Pay now",
                    onTab: () {
                      Get.toNamed(Routes.MAKEPAYMENT, arguments: model);
                    },
                    textColor: green,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children:
                    List.generate(10, (index) => const PaymentHistoryCard()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HighLightButton extends StatelessWidget {
  const HighLightButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.onTab,
    required this.textColor,
  });
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        overlayColor:
            MaterialStateProperty.all(backgroundColor.withOpacity(0.4)),
        onTap: onTab,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 19),
          decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6)),
          child: CustomText(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
