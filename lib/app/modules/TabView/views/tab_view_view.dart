import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/tab_view_controller.dart';

class TabViewView extends GetView<TabViewController> {
  TabViewView({Key? key}) : super(key: key);

  // Define your screen/page widgets here.
  final List<Widget> _screens = [
    HomeTabView(),
    Text("TWO"),
    Text("THE"),
    Text("Four")
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedFontSize: 11,
            iconSize: 12,
            showUnselectedLabels: true,
            selectedItemColor: primaryColor,
            unselectedItemColor: lightText,
            selectedLabelStyle: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600),
            currentIndex: controller.currentIndex.value,
            onTap: controller.onTabTapped,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    MyAssets.home,
                    height: 24,
                    color: controller.currentIndex.value == 0
                        ? primaryColor
                        : disbaleColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                  label: "Loan",
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: SvgPicture.asset(
                      MyAssets.loan,
                      height: 26,
                      color: controller.currentIndex.value == 1
                          ? primaryColor
                          : disbaleColor,
                    ),
                  )),
              BottomNavigationBarItem(
                label: "Help",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    MyAssets.help,
                    height: 24,
                    color: controller.currentIndex.value == 2
                        ? primaryColor
                        : disbaleColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    MyAssets.profilebottom,
                    height: 24,
                    color: controller.currentIndex.value == 3
                        ? primaryColor
                        : disbaleColor,
                  ),
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
