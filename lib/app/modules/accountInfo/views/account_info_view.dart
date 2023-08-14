import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/account_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/account_info_controller.dart';

class AccountInfoView extends GetView<AccountInfoController> {
  const AccountInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Stack(alignment: Alignment.centerLeft, children: [
          Column(
            children: [
              const SizedBox(
                height: 26,
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: monochrome,
                            )),
                      ],
                    ),
                    const CustomText(
                      text: "Account Info",
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 158.0),
                      child: SvgPicture.asset(MyAssets.mic3),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 138.0, bottom: 20),
                      child: SvgPicture.asset(MyAssets.mic1),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        MyAssets.profile,
                        width: 90,
                        fit: BoxFit.cover,
                        height: 90,
                      )),
                  Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: activePin,
                        borderRadius: BorderRadius.circular(10),
                        overlayColor: MaterialStateProperty.all(white),
                        onTap: () {},
                        child: SvgPicture.asset(MyAssets.tableredit)),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 111.0, top: 22),
            child: SvgPicture.asset(MyAssets.mic2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 67.0, top: 72),
            child: SvgPicture.asset(MyAssets.mic4),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.8, top: 72),
            child: SvgPicture.asset(MyAssets.mic4),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.67),
            child: SvgPicture.asset(MyAssets.mic6),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(29),
        child: Column(
          children: [
            Column(
              children: List.generate(controller.list.length,
                  (index) => AccountInfoCard(model: controller.list[index])),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: PrimaryButton(
                title: "Edit",
                onPress: () {
                  Get.toNamed(Routes.EDIT_ACCOUNT);
                },
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({super.key, required this.model});
  final AccountInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9.0, bottom: 16),
          child: CustomText(
            text: model.title,
            fontSize: 16,
            color: lightGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffF3F4F6))),
          child: Column(
              children: List.generate(
                  model.modelList.length,
                  (index) => AccountInfoCardRow(
                        leadingText: model.modelList[index].leadingText,
                        trailingText: model.modelList[index].trailingText,
                      ))),
        )
      ],
    );
  }
}

class AccountInfoCardRow extends StatelessWidget {
  const AccountInfoCardRow({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });
  final String leadingText, trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: leadingText,
              fontSize: 15,
              textAlign: TextAlign.left,
              color: lightGrey,
              fontWeight: FontWeight.w600,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: CustomText(
                text: trailingText,
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.right,
              ),
            ),
          ]),
    );
  }
}
