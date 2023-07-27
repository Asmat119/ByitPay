import 'package:byitpay/app/modules/Loan/controllers/loan_controller.dart';
import 'package:byitpay/app/modules/Loan/views/details_view.dart';
import 'package:byitpay/app/modules/Loan/views/loan_view.dart';
import 'package:byitpay/app/modules/Loan/views/paymnet_view.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/LaonModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanDetailsView extends GetView<LoanController> {
  LoanDetailsView({Key? key}) : super(key: key);
  final LoanModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Container(
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                title: CustomText(
                  text: "Loan Overview",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
                elevation: 0,
                backgroundColor: primaryColor,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: LoanCard(model: model),
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Custom rounded TabBar
            Container(
              height: 48,
              padding: EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 31, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: tabBacjground,
              ),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: disbaleColor,
                unselectedLabelStyle: GoogleFonts.inter(
                    color: activePin, fontWeight: FontWeight.w600),
                labelStyle: GoogleFonts.inter(
                    color: Colors.black, fontWeight: FontWeight.w600),
                indicator: ShapeDecoration(
                  shadows: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.7,
                        spreadRadius: 0.7)
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                ),
                tabs: const [
                  Tab(text: "Details"),
                  Tab(text: "Payment"),
                ],
              ),
            ),
            // TabBarView
            const Expanded(
              child: TabBarView(
                children: [DetailsView(), PaymnetView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
