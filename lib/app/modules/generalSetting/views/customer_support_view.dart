import 'package:byitpay/app/modules/GeneralSetting/controllers/general_setting_controller.dart';
import 'package:byitpay/app/modules/TabView/views/ProfileTab/views/profile_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class CustomerSupportView extends GetView<GeneralSettingController> {
  const CustomerSupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          backPress: () {
            Get.back();
          },
          text: "Customer Support",
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(
              controller.costomerModel.length,
              (index) => ProfileListTile(
                leadingIcon: controller.costomerModel[index].leadingIcon,
                title: controller.costomerModel[index].title,
                isShow: false,
                color: controller.costomerModel[index].color,
                onTab: () {
                  if (controller.costomerModel.last.title == "Help Center") {
                    Get.toNamed(Routes.HELPCENTER);
                  }
                },
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(MyAssets.rightArrow),
                ),
              ),
            ),
          ),
        ));
  }
}
