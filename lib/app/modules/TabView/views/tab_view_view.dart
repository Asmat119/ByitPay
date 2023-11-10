import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_view.dart';
import 'package:byitpay/app/modules/TabView/views/ProfileTab/views/profile_view.dart';
import 'package:byitpay/app/modules/generalSetting/views/helpcenter_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/tab_view_controller.dart';

class TabViewView extends GetView<TabViewController> {
  TabViewView({Key? key}) : super(key: key);

  // Define your screen/page widgets here.
  final List<Widget> _screens = [
    const HomeTabView(),
    const LoanView(),
    const HelpcenterView(),
    const ProfileView()
  ];


  Widget build(BuildContext context) {
    statusBarDark();

    return
      SafeArea(
        child:

        Scaffold(
          bottomNavigationBar: PersistentTabView(


            context,
            controller: controller.persistentTabController.value,
            screens: _screens,
            navBarHeight: 64,
            onItemSelected: (index) {
              controller.onTabTapped(index);
            },
            items: [
              PersistentBottomNavBarItem(
                icon:
                Obx(() {
                  return Column(

                    children: [

                      SvgPicture.asset(
                        MyAssets.home,
                        height: 24,
                        color: controller.currentIndex.value ==
                            0
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
                        color: controller.currentIndex.value ==
                            0
                            ? primaryColor
                            : disbaleColor,
                      )
                    ],
                  );
                }),


              ),
              PersistentBottomNavBarItem(
                textStyle: const TextStyle(fontSize: 0),
                icon:

                Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        MyAssets.loan,
                        height: 24,
                        color: controller.currentIndex.value ==
                            1
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
                        color: controller.currentIndex.value ==
                            1
                            ? primaryColor
                            : disbaleColor,
                      )
                    ],
                  );
                }),


              ),
              PersistentBottomNavBarItem(
                textStyle: const TextStyle(fontSize: 0),
                icon:

                Obx(() {
                  return Column(
                    children: [
                      SvgPicture.asset(
                        MyAssets.help,
                        height: 24,
                        color: controller.currentIndex.value ==
                            2
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
                        color: controller.currentIndex.value ==
                            2
                            ? primaryColor
                            : disbaleColor,
                      )
                    ],
                  );
                }),


              ),
              PersistentBottomNavBarItem(
                  textStyle: const TextStyle(fontSize: 0),
                  icon:

                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          MyAssets.profilebottom,
                          height: 24,
                          color: controller.currentIndex.value ==
                              3
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
                          color: controller.currentIndex.value ==
                              3
                              ? primaryColor
                              : disbaleColor,
                        )
                      ],
                    );
                  })


              ),

            ],
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            // Default is Colors.white.
            handleAndroidBackButtonPress: true,


            // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: false,
            // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(0.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            // itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            //   duration: Duration(milliseconds: 200),
            //   curve: Curves.ease,
            // ),

            navBarStyle: NavBarStyle
                .style13, // Choose the nav bar style with this property.
          ),
        ),


      );
    //   SafeArea(
    //   child: Scaffold(
    //     bottomNavigationBar: Obx(
    //       () => BottomNavigationBar(
    //         selectedFontSize: 11,
    //
    //         showUnselectedLabels: true,
    //         selectedItemColor: primaryColor,
    //         unselectedItemColor: lightText,
    //         selectedLabelStyle: GoogleFonts.inter(
    //             color: primaryColor, fontWeight: FontWeight.w600),
    //         unselectedLabelStyle: GoogleFonts.inter(
    //             color: Colors.grey, fontWeight: FontWeight.w600),
    //         currentIndex: controller.currentIndex.value,
    //         onTap: controller.onTabTapped,
    //         items: [
    //           BottomNavigationBarItem(
    //
    //             label: "",
    //             icon: Column(
    //
    //               children: [
    //                 SvgPicture.asset(
    //                   MyAssets.home,
    //                   height: 24,
    //                   color: controller.currentIndex.value == 0
    //                       ? primaryColor
    //                       : disbaleColor,
    //                 ),
    //                 const SizedBox(
    //                   height: 3,
    //                 ),
    //                 CustomText(
    //                   text: "Home",
    //                   fontSize: 11,
    //                   fontWeight: FontWeight.bold,
    //                   color: controller.currentIndex.value == 0
    //                       ? primaryColor
    //                       : disbaleColor,
    //                 )
    //               ],
    //             ),
    //           ),
    //           BottomNavigationBarItem(
    //               label: "",
    //               icon: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   SvgPicture.asset(
    //                     MyAssets.loan,
    //                     height: 24,
    //                     color: controller.currentIndex.value == 1
    //                         ? primaryColor
    //                         : disbaleColor,
    //                   ),
    //                   const SizedBox(
    //                     height: 3,
    //                   ),
    //                   CustomText(
    //                     text: "Loan",
    //                     fontSize: 11,
    //                     fontWeight: FontWeight.bold,
    //                     color: controller.currentIndex.value == 1
    //                         ? primaryColor
    //                         : disbaleColor,
    //                   )
    //                 ],
    //               )),
    //           BottomNavigationBarItem(
    //             label: "",
    //             icon: Column(
    //               children: [
    //                 SvgPicture.asset(
    //                   MyAssets.help,
    //                   height: 24,
    //                   color: controller.currentIndex.value == 2
    //                       ? primaryColor
    //                       : disbaleColor,
    //                 ),
    //                 const SizedBox(
    //                   height: 3,
    //                 ),
    //                 CustomText(
    //                   text: "Help",
    //                   fontSize: 11,
    //                   fontWeight: FontWeight.bold,
    //                   color: controller.currentIndex.value == 2
    //                       ? primaryColor
    //                       : disbaleColor,
    //                 )
    //               ],
    //             ),
    //           ),
    //           BottomNavigationBarItem(
    //             label: "",
    //             icon: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 SvgPicture.asset(
    //                   MyAssets.profilebottom,
    //                   height: 24,
    //                   color: controller.currentIndex.value == 3
    //                       ? primaryColor
    //                       : disbaleColor,
    //                 ),
    //                 const SizedBox(
    //                   height: 3,
    //                 ),
    //                 CustomText(
    //                   text: "Profile",
    //                   fontSize: 11,
    //                   fontWeight: FontWeight.bold,
    //                   color: controller.currentIndex.value == 3
    //                       ? primaryColor
    //                       : disbaleColor,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     body:Obx(
    //         () => Container(child: _screens[controller.currentIndex.value])),
    //   ),
    // );
  }
}
