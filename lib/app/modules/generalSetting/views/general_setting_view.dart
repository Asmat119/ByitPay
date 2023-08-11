import 'package:byitpay/app/modules/TabView/views/ProfileTab/views/profile_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/general_setting_controller.dart';

class GeneralSettingView extends GetView<GeneralSettingController> {
  const GeneralSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          backPress: () {
            Get.back();
          },
          text: "General Setting",
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileListTile(
                leadingIcon: MyAssets.simpleBell,
                title: "Enable  Push notification",
                isShow: false,
                color: purple,
                trailing: Obx(() => Transform.scale(
                      scale: 0.75,
                      child: CupertinoSwitch(
                          activeColor: activePin,
                          value: controller.onOff.value,
                          onChanged: (value) {
                            controller.switchOnOff();
                          }),
                    )),
              ),
              ProfileListTile(
                leadingIcon: MyAssets.simpleBell,
                title: "Notifications",
                isShow: false,
                color: activePin,
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(MyAssets.rightArrow),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              ProfileListTile(
                leadingIcon: MyAssets.lock,
                title: "Change Login in PIN",
                isShow: false,
                color: green,
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(MyAssets.rightArrow),
                ),
              ),
            ],
          ),
        ));
  }
}
