import 'package:byitpay/app/modules/Loan/controllers/loan_controller.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class DetailsView extends GetView<LoanController> {
  const DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
                children: List.generate(
              controller.itemList.length,
              (index) {
                return DetaiListTile(
                  heading: "",
                  count: controller.itemList.length,
                  index: index,
                  title: controller.itemList[index].title,
                  leading: controller.itemList[index].leading,
                  isButton: controller.itemList[index].isButton,
                  isIcon: controller.itemList[index].isIcon,
                );
              },
            )),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 6,
              color: tabBacjground,
            ),
            SizedBox(
              height: 22,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomText(
                    text: "Balance Details",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                    children: List.generate(
                  controller.balanceDetailsList.length,
                  (index) {
                    return DetaiListTile(
                      heading: "",
                      count: controller.balanceDetailsList.length,
                      index: index,
                      title: controller.balanceDetailsList[index].title,
                      leading: controller.balanceDetailsList[index].leading,
                      isButton: controller.balanceDetailsList[index].isButton,
                      isIcon: controller.balanceDetailsList[index].isIcon,
                    );
                  },
                )),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 6,
              color: tabBacjground,
            ),
            SizedBox(
              height: 22,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomText(
                    text: "Documents",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                    children: List.generate(
                  controller.documentList.length,
                  (index) {
                    return DetaiListTile(
                      heading: "",
                      count: controller.documentList.length,
                      index: index,
                      title: controller.documentList[index].title,
                      leading: controller.documentList[index].leading,
                      isButton: controller.documentList[index].isButton,
                      isIcon: controller.documentList[index].isIcon,
                    );
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetaiListTile extends StatelessWidget {
  const DetaiListTile(
      {super.key,
      required this.heading,
      required this.title,
      required this.leading,
      this.isButton = false,
      this.isIcon = false,
      this.index,
      required this.count});
  final String heading, title, leading;
  final bool? isButton, isIcon;

  final int? count;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                isButton == false && isIcon == false
                    ? CustomText(
                        text: leading,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )
                    : Text(""),
                isIcon!
                    ? SvgPicture.asset(MyAssets.rightArrow)
                    : const Text(""),
                isButton!
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 19),
                        decoration: BoxDecoration(
                            color: green.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6)),
                        child: CustomText(
                          text: "On track",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: green,
                        ),
                      )
                    : const Text(""),
              ],
            ),
            index! <= count! - 2
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  )
                : Text(""),
          ],
        ),
      )
    ]);
  }
}
