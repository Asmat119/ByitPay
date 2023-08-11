import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoanView extends GetView<TabViewController> {
  const LoanView({Key? key}) : super(key: key);
  final double progressValue = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(
            text: "Loan",
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: "Search",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                  CustomText(
                    text: "Most recent",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children:
                            List.generate(controller.modelList.length, (index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Get.toNamed(Routes.LOANDETAILS,
                                  arguments: controller.modelList[index]);
                            },
                            child: LoanCard(
                              model: controller.modelList[index],
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              // Get.toNamed(Routes.LOANDETAILS);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  border: Border.all(width: 1, color: white),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    child: CustomText(
                                      text: "Apply now",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class LoanCard extends StatelessWidget {
  const LoanCard({super.key, required this.model});
  final LoanModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(
                  MyAssets.linearBackground,
                ),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  CustomText(
                    text: model.amount,
                    fontSize: 20,
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 3),
                    child: SvgPicture.asset(
                      MyAssets.arrowup,
                      color: model.isPaid ? Colors.green : activePin,
                    ),
                  ),
                  CustomText(
                    text: model.paidAmount,
                    fontSize: 12,
                    color: model.isPaid ? Colors.green : activePin,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 9),
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))),
                    child: CustomText(
                      text: "Interest ${model.interest}",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWithIcon(
                        text: "Code",
                        iconPath: MyAssets.code,
                        subTitle: model.code,
                      ),
                      TextWithIcon(
                        text: "Money",
                        iconPath: MyAssets.pouch,
                        subTitle: model.money,
                      ),
                      TextWithIcon(
                        text: "Loan term",
                        iconPath: MyAssets.calendar,
                        subTitle: model.loanTerm,
                      ),
                      const Text("     "),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GradientProgressBar(
                    percent: model.isPaid ? 1 : 0.5,
                    gradient: linearGradientProgressBar,
                    background: Colors.green,
                    isGradientd: !model.isPaid,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: model.status,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                      const Spacer(),
                      !model.status.contains("P")
                          ? const CustomText(
                              text: "02/15/2023",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: white,
                            )
                          : const Text(""),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWithIcon extends StatelessWidget {
  const TextWithIcon(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.subTitle});
  final String text, iconPath, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(
              width: 4,
            ),
            CustomText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: lightGrey,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        CustomText(
          text: subTitle,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: white,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class GradientProgressBar extends StatelessWidget {
  final double percent;
  final LinearGradient gradient;
  final Color? background;
  final Color? backgroundProgressColor;
  final bool? isGradientd;
  final bool? isGradientdBacground;

  const GradientProgressBar(
      {required this.percent,
      required this.gradient,
      this.background,
      this.isGradientd,
      this.isGradientdBacground = false,
      this.backgroundProgressColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 8,
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isGradientdBacground!
                  ? backgroundProgressColor
                  : Colors.black.withOpacity(0.71)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient:
                  isGradientdBacground! ? linearGradientProgressBar : null),
        ),
        Container(
          width: MediaQuery.of(context).size.width * percent,
          height: 8,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(4),
              gradient: isGradientd! ? gradient : null),
        ),
      ],
    );
  }
}
