import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralSettingController extends GetxController {


  RxBool onOff = true.obs;
  RxBool onOffFingerPrint = true.obs;
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
  void switchOnOffFinger() => onOffFingerPrint.value = !onOffFingerPrint.value;
  void notificationSwitchOnOff() =>
      notificationOnOff.value = !notificationOnOff.value;
}
