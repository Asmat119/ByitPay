import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/help_model.dart';
import 'package:byitpay/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralSettingController extends GetxController {
  List<HelpModel> helperList = [
    HelpModel(heading: MyConstants.heading1, message: MyConstants.msg1),
    HelpModel(heading: MyConstants.heading2, message: MyConstants.msg2),
    HelpModel(heading: MyConstants.heading3, message: MyConstants.msg3),
  ];

  RxBool onOff = true.obs;
  Rx<TextEditingController> searchEditingController =
      TextEditingController().obs;
  RxString searchText = "".obs;
  RxBool notificationOnOff = true.obs;
  final count = 0.obs;
  List<ProfileModel> profileModel = [
    ProfileModel(
        leadingIcon: MyAssets.info,
        title: "Terms of Use",
        ishowDivider: false,
        color: Colors.red),
    ProfileModel(
        leadingIcon: MyAssets.lock,
        title: "Privacy Policy",
        ishowDivider: true,
        color: green),
    ProfileModel(
        leadingIcon: MyAssets.document,
        title: "Disclosure",
        ishowDivider: false),
  ];
  List<ProfileModel> costomerModel = [
    ProfileModel(
      leadingIcon: MyAssets.chatting,
      title: "Submit a Support Ticket",
      ishowDivider: false,
    ),
    ProfileModel(
      leadingIcon: MyAssets.whatsApp,
      title: "Message us on WhatsApp",
      ishowDivider: true,
    ),
    ProfileModel(
        leadingIcon: MyAssets.helpcneter,
        title: "Help Center",
        ishowDivider: false),
  ];
  void switchOnOff() => onOff.value = !onOff.value;
  void notificationSwitchOnOff() =>
      notificationOnOff.value = !notificationOnOff.value;
}
