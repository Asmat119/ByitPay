import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class ProfileView extends GetView<TabViewController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(266),
      //   child: Container(
      //     decoration: const BoxDecoration(
      //         color: primaryColor,
      //         borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(24),
      //             bottomRight: Radius.circular(24))),
      //     child: Column(
      //       children: [
      //         AppBar(
      //           flexibleSpace: Column(
      //             children: [
      //               Row(children: [
      //                 const Spacer(),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 18.0),
      //                   child: CircleAvatar(
      //                     radius: 35,
      //                     backgroundImage: AssetImage(MyAssets.profile),
      //                   ),
      //                 ),
      //                 const Spacer(),
      //               ]),
      //               Column(
      //                 children: [
      //                   const SizedBox(
      //                     height: 9,
      //                   ),
      //                   const CustomText(
      //                     text: "Andrea Plummer",
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                     color: white,
      //                   ),
      //                   const CustomText(
      //                     text: "+1876-123-4567",
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.w500,
      //                     color: monochrome,
      //                   ),
      //                   const SizedBox(
      //                     height: 22,
      //                   ),
      //                   Container(
      //                     margin: const EdgeInsets.symmetric(horizontal: 28),
      //                     padding: const EdgeInsets.symmetric(
      //                         horizontal: 16, vertical: 12),
      //                     decoration: BoxDecoration(
      //                         color: const Color(0XFF5C42C1).withOpacity(0.15),
      //                         borderRadius: BorderRadius.circular(16)),
      //                     child: Row(
      //                       children: [
      //                         SvgPicture.asset(
      //                           MyAssets.rightArrow,
      //                           color: white,
      //                         ),
      //                         const SizedBox(
      //                           width: 8,
      //                         ),
      //                         const Flexible(
      //                           child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 CustomText(
      //                                   text: "Complete Your Profile!",
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w600,
      //                                   color: white,
      //                                 ),
      //                                 Padding(
      //                                   padding:
      //                                       EdgeInsets.symmetric(vertical: 8.0),
      //                                   child: GradientProgressBar(
      //                                     percent: 0.4,
      //                                     gradient: linearGradientProgressBar,
      //                                     isGradientd: false,
      //                                     background: Colors.white,
      //                                     isGradientdBacground: true,
      //                                     backgroundProgressColor: Colors.blue,
      //                                   ),
      //                                 ),
      //                                 CustomText(
      //                                   text:
      //                                       "Complete additional details on your profile",
      //                                   fontSize: 12,
      //                                   fontWeight: FontWeight.w500,
      //                                   color: primaryblue200,
      //                                 )
      //                               ]),
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //           actions: [
      //             SvgPicture.asset(MyAssets.bell),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 7.0, right: 21),
      //               child: SvgPicture.asset(MyAssets.chat),
      //             ),
      //           ],
      //           elevation: 0,
      //           backgroundColor: primaryColor,
      //           leading: IconButton(
      //             onPressed: () {
      //               Get.back();
      //             },
      //             icon: const Icon(Icons.arrow_back_ios),
      //           ),
      //         ),
      //         // Padding(
      //         //     padding: const EdgeInsets.only(top: 9.0),
      //         //     child: Column(
      //         //       children: [
      //         //         CustomText(
      //         //           text: "Andrea Plummer",
      //         //           fontSize: 20,
      //         //           fontWeight: FontWeight.bold,
      //         //           color: white,
      //         //         ),
      //         //         CustomText(
      //         //           text: "+1876-123-4567",
      //         //           fontSize: 15,
      //         //           fontWeight: FontWeight.w500,
      //         //           color: monochrome,
      //         //         ),
      //         //         Container(
      //         //           margin: const EdgeInsets.symmetric(horizontal: 33),
      //         //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      //         //           decoration: const BoxDecoration(color: Colors.black),
      //         //           child: Row(
      //         //             children: [
      //         //               SvgPicture.asset(
      //         //                 MyAssets.rightArrow,
      //         //                 color: white,
      //         //               ),
      //         //               Column(
      //         //                   crossAxisAlignment: CrossAxisAlignment.start,
      //         //                   children: [
      //         //                     CustomText(
      //         //                       text: "Complete Your Profile!",
      //         //                       fontSize: 14,
      //         //                       fontWeight: FontWeight.w600,
      //         //                       color: white,
      //         //                     ),
      //         //                     const Padding(
      //         //                       padding:
      //         //                           EdgeInsets.symmetric(vertical: 8.0),
      //         //                       child: Expanded(
      //         //                         child: GradientProgressBar(
      //         //                           percent: 0.4,
      //         //                           gradient: linearGradientProgressBar,
      //         //                           isGradientd: false,
      //         //                           background: Colors.white,
      //         //                           isGradientdBacground: true,
      //         //                           backgroundProgressColor: Colors.blue,
      //         //                         ),
      //         //                       ),
      //         //                     ),
      //         //                     CustomText(
      //         //                       text:
      //         //                           "Complete additional details on your profile",
      //         //                       fontSize: 12,
      //         //                       fontWeight: FontWeight.w500,
      //         //                       color: primary_blue_200,
      //         //                     )
      //         //                   ]),
      //         //             ],
      //         //           ),
      //         //         )
      //         //       ],
      //         //     ),
      //         //     ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),

                    child: AppBar(

                      flexibleSpace: Column(
                        children: [
                          Row(children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(MyAssets.profile),
                              ),
                            ),
                            const Spacer(),
                          ]),
                          Column(
                            children: [
                              const SizedBox(
                                height: 9,
                              ),
                              const CustomText(
                                text: "Andrea Plummer",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                               CustomText(
                                text: "+1876-123-4567",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: white.withOpacity(0.7),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 28),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                    color: const Color(0XFF5C42C1).withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      MyAssets.rightArrow,
                                      color: white,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Flexible(
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "Complete Your Profile!",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.symmetric(vertical: 8.0),
                                              child: GradientProgressBar(
                                                percent: 0.4,
                                                gradient: linearGradientProgressBar,
                                                isGradientd: false,
                                                background: Colors.white,
                                                isGradientdBacground: true,
                                                backgroundProgressColor: Colors.blue,
                                              ),
                                            ),
                                            CustomText(
                                              text:
                                              "Complete additional details on your profile",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: primaryblue200,
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 31
                                ,
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        SvgPicture.asset(MyAssets.bell),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0, right: 21),
                          child: SvgPicture.asset(MyAssets.chat),
                        ),
                      ],
                      elevation: 0,
                      backgroundColor: primaryColor,
                      automaticallyImplyLeading: false,
                      // leading: IconButton(
                      //   onPressed: () {
                      //     Get.back();
                      //   },
                      //   icon: const Icon(Icons.arrow_back_ios),
                      // ),
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(top: 9.0),
                  //     child: Column(
                  //       children: [
                  //         CustomText(
                  //           text: "Andrea Plummer",
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //           color: white,
                  //         ),
                  //         CustomText(
                  //           text: "+1876-123-4567",
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w500,
                  //           color: monochrome,
                  //         ),
                  //         Container(
                  //           margin: const EdgeInsets.symmetric(horizontal: 33),
                  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  //           decoration: const BoxDecoration(color: Colors.black),
                  //           child: Row(
                  //             children: [
                  //               SvgPicture.asset(
                  //                 MyAssets.rightArrow,
                  //                 color: white,
                  //               ),
                  //               Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     CustomText(
                  //                       text: "Complete Your Profile!",
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: white,
                  //                     ),
                  //                     const Padding(
                  //                       padding:
                  //                           EdgeInsets.symmetric(vertical: 8.0),
                  //                       child: Expanded(
                  //                         child: GradientProgressBar(
                  //                           percent: 0.4,
                  //                           gradient: linearGradientProgressBar,
                  //                           isGradientd: false,
                  //                           background: Colors.white,
                  //                           isGradientdBacground: true,
                  //                           backgroundProgressColor: Colors.blue,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     CustomText(
                  //                       text:
                  //                           "Complete additional details on your profile",
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w500,
                  //                       color: primary_blue_200,
                  //                     )
                  //                   ]),
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //     ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 13),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(controller.profileModel.length, (index) {
                  return ProfileListTile(
                    leadingIcon: controller.profileModel[index].leadingIcon,
                    title: controller.profileModel[index].title,
                    isShow: controller.profileModel[index].ishowDivider,
                    onTab: () {
                      if (controller.profileModel[index].title ==
                          "General Setting") {
                        Get.toNamed(Routes.GENERAL_SETTING);
                      }
                      if (controller.profileModel[index].title ==
                          "Change Login in PIN") {
                        Get.toNamed(Routes.CHANGEPIN);
                      }
                      if (controller.profileModel[index].title == "Notifications") {
                        Get.toNamed(Routes.NOTIFICATION_SETTING);
                      }
                      if (controller.profileModel[index].title == "Documents") {
                        Get.toNamed(Routes.DOCUMENT);
                      }
                      if (controller.profileModel[index].title ==
                          "Customer Support") {
                        Get.toNamed(Routes.CUSTOMERSUPPORT);
                      }
                      if (controller.profileModel[index].title ==
                          "Account Info") {
                        Get.toNamed(Routes.ACCOUNT_INFO);
                      }
                    },
                    color: controller.profileModel[index].color,
                    trailing: SvgPicture.asset(MyAssets.rightArrow),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.isShow,
      this.trailing,
      this.onTab,
      this.color});
  final String leadingIcon, title;
  final bool isShow;
  final Color? color;
  final dynamic trailing;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTab ?? () {},
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          titleAlignment: ListTileTitleAlignment.threeLine,
          trailing: trailing,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: tabBacjground, borderRadius: BorderRadius.circular(12)),
            child: SvgPicture.asset(
              leadingIcon,
              color: color ?? null,
            ),
          ),
          title: CustomText(
            text: title,
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
        ),
        isShow
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(),
              )
            : Container(),
      ],
    );
  }
}
