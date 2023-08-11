import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_view.dart';
import 'package:byitpay/app/modules/TabView/views/ProfileTab/views/profile_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tab_view_controller.dart';

class TabViewView extends GetView<TabViewController> {
  TabViewView({Key? key}) : super(key: key);

  // Define your screen/page widgets here.
  final List<Widget> _screens = [
    const HomeTabView(),
    const LoanView(),
    const Text("THE"),
    const ProfileView()
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedFontSize: 11,

            showUnselectedLabels: true,
            selectedItemColor: primaryColor,
            unselectedItemColor: lightText,
            selectedLabelStyle: GoogleFonts.inter(
                color: primaryColor, fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.inter(
                color: Colors.grey, fontWeight: FontWeight.w600),
            // currentIndex: controller.currentIndex.value,
            onTap: controller.onTabTapped,
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      MyAssets.home,
                      height: 24,
                      color: controller.currentIndex.value == 0
                          ? primaryColor
                          : disbaleColor,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomText(
                      text: "Home",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: controller.currentIndex.value == 0
                          ? primaryColor
                          : disbaleColor,
                    )
                  ],
                ),
              ),
              BottomNavigationBarItem(
                  label: "",
                  icon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        MyAssets.loan,
                        height: 24,
                        color: controller.currentIndex.value == 1
                            ? primaryColor
                            : disbaleColor,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      CustomText(
                        text: "Loan",
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: controller.currentIndex.value == 1
                            ? primaryColor
                            : disbaleColor,
                      )
                    ],
                  )),
              BottomNavigationBarItem(
                label: "",
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      MyAssets.help,
                      height: 24,
                      color: controller.currentIndex.value == 2
                          ? primaryColor
                          : disbaleColor,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomText(
                      text: "Help",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: controller.currentIndex.value == 2
                          ? primaryColor
                          : disbaleColor,
                    )
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      MyAssets.profilebottom,
                      height: 24,
                      color: controller.currentIndex.value == 3
                          ? primaryColor
                          : disbaleColor,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomText(
                      text: "Profile",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: controller.currentIndex.value == 3
                          ? primaryColor
                          : disbaleColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Obx(
            () => Container(child: _screens[controller.currentIndex.value])),
      ),
    );
  }
}
