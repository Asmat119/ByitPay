import 'package:byitpay/app/modules/Loan/controllers/loan_controller.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaymnetView extends GetView<LoanController> {
  const PaymnetView({Key? key}) : super(key: key);
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
                  CustomText(
                    text: "Auto -Pay",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: linearRed,
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 19),
                    decoration: BoxDecoration(
                        color: activePin.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6)),
                    child: CustomText(
                      text: "Disabled",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: activePin,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(),
              ),
              Row(
                children: [
                  CustomText(
                    text: "Payment History",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 19),
                    decoration: BoxDecoration(
                        color: green.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6)),
                    child: CustomText(
                      text: "Pay now",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: List.generate(10, (index) => PaymentHistoryCard()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
