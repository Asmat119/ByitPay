import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/receipt_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Receipt extends StatelessWidget {
  Receipt({Key? key}) : super(key: key);

  final String loanID = "Loan ID BYLKGJ10";
  final String totolaAmount = "\$6250 JMD";
  final List<ReceiptModel> modelList = [
    ReceiptModel(leading: "Date", trailing: "May 12, 2021  5:30PM"),
    ReceiptModel(leading: "Source", trailing: "Bank Card"),
    ReceiptModel(leading: "Transaction ID", trailing: "BYLP523652"),
    ReceiptModel(
        leading: "Account", trailing: "Andrea Plummer", isShowDivider: true),
    ReceiptModel(leading: "Principle", trailing: "\$5900 JMD"),
    ReceiptModel(
        leading: "Interest Paid", trailing: "350 JMD", isShowTotal: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tabBacjground,
      appBar: CustomAppBar(
        backPress: () {
          Get.back();
        },
        text: "Payment Details",
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ReceiptCard(
            loanID: loanID,
            totalAmount: totolaAmount,
            list: modelList,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 52.0),
            child: PrimaryButton(title: "Email Receipt", onPress: () {}),
          ),
          TextButton(
              onPressed: () {},
              child: const CustomText(
                text: "Close",
                fontSize: 15,
                color: activePin,
                fontWeight: FontWeight.w600,
              ))
        ],
      )),
    );
  }
}

class ReceiptCard extends StatelessWidget {
  const ReceiptCard(
      {super.key,
      required this.loanID,
      required this.totalAmount,
      required this.list});
  final String loanID, totalAmount;
  final List<ReceiptModel> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 30),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: tabBacjground,
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: Offset(1.0, 1.9))
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: white,
                    ),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 34.0),
                        child: Column(
                          children: [
                            CustomText(
                              text: loanID,
                              fontSize: 15,
                              color: grey,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              text: totalAmount,
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: List.generate(
                                  list.length,
                                  (index) => ReceiptRowWidget(
                                        receiptModel: list[index],
                                      )),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      8,
                      (index) => Container(
                        width: 22,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: tabBacjground,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 98,
              padding: const EdgeInsets.all(7),
              width: 98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: activePin.withOpacity(0.1)),
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: activePin),
                child: SvgPicture.asset(
                  MyAssets.check,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiptRowWidget extends StatelessWidget {
  const ReceiptRowWidget({
    required this.receiptModel,
    super.key,
  });
  final ReceiptModel receiptModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              CustomText(
                text: receiptModel.leading,
                fontSize: 15,
                color: lightText,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              CustomText(
                text: receiptModel.trailing,
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        receiptModel.isShowDivider!
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: DottedLine(
                    dashColor: buttonDisbaleColor,
                    lineThickness: 2.0,
                    dashLength: 5.0),
              )
            : const Text(
                "",
                style: TextStyle(fontSize: 0),
              ),
        receiptModel.isShowTotal!
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: "Total",
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                    CustomText(
                      text: "\$6250 JMD",
                      fontSize: 16,
                      color: green,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              )
            : const Text("", style: TextStyle(fontSize: 0))
      ],
    );
  }
}
