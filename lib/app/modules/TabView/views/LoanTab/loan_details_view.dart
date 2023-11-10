import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/details_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/paymnet_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanDetailsView extends GetView<TabViewController> {
  LoanDetailsView({Key? key}) : super(key: key);
  final LoanModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: LoanPaymentCard(model: model, onTab: (){Get.back();},),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Custom rounded TabBar
            Container(
              height: 48,
              padding: const EdgeInsets.all(4),
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
            Expanded(
              child: TabBarView(
                children: [const DetailsView(), PaymnetView(model)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoanPaymentCard extends StatelessWidget implements PreferredSizeWidget {
  const LoanPaymentCard({
    super.key,
    required this.model,
    this.onTab
  });
  @override
  Size get preferredSize => const Size.fromHeight(260);
  final LoanModel model;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    statusBarDark();
    return PreferredSize(
      preferredSize: preferredSize,
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
              title: const CustomText(
                text: "Loan Overview",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: white,
              ),
              elevation: 0,
              backgroundColor: primaryColor,
              leading: IconButton(
                onPressed: onTab ?? (){

                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: LoanCard(model: model)),
            )
          ],
        ),
      ),
    );
  }
}
