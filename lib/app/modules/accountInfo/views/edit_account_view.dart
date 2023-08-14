import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/controllers/account_info_controller.dart';
import 'package:byitpay/app/modules/accountInfo/views/tabs/contact_info_view.dart';
import 'package:byitpay/app/modules/accountInfo/views/tabs/edit_address_view.dart';
import 'package:byitpay/app/modules/accountInfo/views/tabs/personal_info_view.dart';
import 'package:byitpay/constants/my_colors.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAccountView extends GetView<AccountInfoController> {
  const EditAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: white,
          bottom: TabBar(
            isScrollable: true,
            labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
            labelColor: activePin,
            indicatorColor: activePin,
            unselectedLabelColor: lightGrey,
            tabs: const [
              Tab(
                text: "Personal Info",
              ),
              Tab(
                text: "Contact Info",
              ),
              Tab(
                text: "Address",
              ),
            ],
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: monochrome,
              )),
          title: const CustomText(
            text: "Edit Account",
            fontSize: 18,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: const TabBarView(
          children: [
            PersonalInfoView(),
            ContactInfoView(),
            EditAddressView(),
          ],
        ),
      ),
    );
  }
}
