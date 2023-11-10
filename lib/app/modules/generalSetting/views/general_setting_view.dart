import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/ProfileTab/views/profile_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/general_setting_controller.dart';

class GeneralSettingView extends GetView<GeneralSettingController> {
  const GeneralSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    statusBarLight();
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
                leadingIcon: MyAssets.faceid,
                title: "Enable Face or Fingerprint",
                isShow: false,
                trailing: Obx(() => Transform.scale(
                      scale: 0.75,
                      child: CupertinoSwitch(
                          activeColor: activePin,
                          value: controller.onOffFingerPrint.value,
                          onChanged: (value) {
                            controller.switchOnOffFinger();
                          }),
                    )),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
          ListTile(
            onTap: () {
              Get.toNamed(Routes.CHANGEPIN);
            },
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            titleAlignment: ListTileTitleAlignment.threeLine,
            leading: SvgPicture.asset(
              MyAssets.unlock,

            ),
            title: const CustomText(
              text: "Change Login PIN",
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(MyAssets.rightArrow, width: 24,),
            ),
          ),

          ListTile(
            onTap: () {
              Get.toNamed(Routes.CREATEPIN);

            },
            contentPadding: const EdgeInsets.symmetric(vertical: 4),

            leading:  Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                  color: tabBacjground, borderRadius: BorderRadius.circular(12)),
              child: SvgPicture.asset(
                MyAssets.changePasswrod,

              ),
            ),
            title: const CustomText(
              text: "Change Password",
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(MyAssets.rightArrow, width: 24,),
            ),
          ),
            ],
          ),
        ));
  }
}
