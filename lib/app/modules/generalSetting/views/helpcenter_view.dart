import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/GeneralSetting/controllers/general_setting_controller.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_document_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpcenterView extends GetView<GeneralSettingController> {
  const HelpcenterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          backPress: () {
            Get.back();
          },
          text: "Help Center",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(29),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const PrimaryText(
                    title: "Hi Andrea, how can we help you?", subTitle: ""),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0XFFF9FAFB)),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    controller: controller.searchEditingController.value,
                    onChanged: (String? value) {
                      controller.searchText.value = value!;
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Search",
                        prefixIconConstraints: const BoxConstraints(
                          maxHeight: 24,
                          minWidth: 24,
                        ),
                        prefixIcon: SizedBox(
                          width: 35,
                          child: SvgPicture.asset(MyAssets.search),
                        ),
                        hintStyle: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff9CA3AF)),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextPoppins(
                        text: "Frequently Asked", fontSize: 18),
                    TextButton(
                        onPressed: () {},
                        child: const CustomTextPoppins(
                          text: "View All",
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                Column(
                    children: List.generate(
                        controller.helperList.length,
                        (index) => HelpCenterCard(
                            heading: controller.helperList[index].heading,
                            message: controller.helperList[index].message))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: PrimaryButton(
                    title: "Load More",
                    onPress: () {},
                    fontWeight: FontWeight.w600,
                  ),
                )
              ]),
        ));
  }
}

class HelpCenterCard extends StatelessWidget {
  const HelpCenterCard({
    super.key,
    required this.heading,
    required this.message,
  });
  final String heading, message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffF3F4F6))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(textAlign: TextAlign.start, text: heading, fontSize: 18),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          text: message,
          fontSize: 12,
          textAlign: TextAlign.start,
          color: Colors.black.withOpacity(0.6),
        ),
      ]),
    );
  }
}
