import 'package:byitpay/app/modules/GeneralSetting/controllers/general_setting_controller.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotificationSettingView extends GetView<GeneralSettingController> {
  const NotificationSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          backPress: () {
            Get.back();
          },
          text: "Notifications",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(31),
          child: Column(
            children: [
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: CustomText(
                  text: "Default Notification Actions",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.left,
                ),
                trailing: Text(""),
                subtitle: CustomText(
                  text:
                      "You want to receive reminders before a payment is due.",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  color: lightText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Divider(),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const CustomText(
                  text: "Promotions",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.left,
                ),
                trailing: Obx(() => Transform.scale(
                      scale: 0.75,
                      child: CupertinoSwitch(
                          activeColor: activePin,
                          value: controller.notificationOnOff.value,
                          onChanged: (value) {
                            controller.notificationSwitchOnOff();
                          }),
                    )),
                subtitle: const CustomText(
                  text:
                      "You want to receive reminders before a payment is due.",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  color: lightText,
                ),
              ),
            ],
          ),
        ));
  }
}
