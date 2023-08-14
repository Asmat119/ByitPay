import 'package:byitpay/model/account_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountInfoController extends GetxController {
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController occupationEditingController =
      TextEditingController();
  final TextEditingController employeeEditingController =
      TextEditingController();
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final TextEditingController emaileEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController cityEditingController = TextEditingController();
  final TextEditingController countryEditingController =
      TextEditingController();
  final TextEditingController fullNameEditingController =
      TextEditingController();
  Rx<TextEditingController> lastDigitEditingController =
      TextEditingController().obs;

  RxString selectedValue = "Female".obs;
  RxString lastDigitTextValue = "".obs;
  RxString selectedClosedropValue = "Early Repayment".obs;

  RxBool isSubmit = false.obs;
  RxBool isClose = false.obs;

  List<String> dropdowList = ["Female", "Male", "Others"];
  List<String> closeAccountDropList = ["Early Repayment", "Late Repayment"];

  List<AccountInfoModel> list = [
    AccountInfoModel(title: "Personal Info", modelList: [
      AccountInfoRowModel(
          leadingText: "Your name", trailingText: "Andrea Plummer"),
      AccountInfoRowModel(leadingText: "Occupation", trailingText: "Designer"),
      AccountInfoRowModel(leadingText: "Employer", trailingText: "Quik Pay"),
      AccountInfoRowModel(leadingText: "Gender", trailingText: "Female"),
    ]),
    AccountInfoModel(title: "Contact Info", modelList: [
      AccountInfoRowModel(
          leadingText: "Phone number", trailingText: "876-123-4567"),
      AccountInfoRowModel(
          leadingText: "Email", trailingText: "andrea@test.com"),
    ]),
    AccountInfoModel(title: "Address", modelList: [
      AccountInfoRowModel(
          leadingText: "Street",
          trailingText: "Lot 107 Kings Ave, Linstead PO"),
      AccountInfoRowModel(
          leadingText: "Parish,Country", trailingText: "St.Catherine, Jamaica"),
    ]),
  ];

  @override
  void onInit() {
    super.onInit();
    setTextFieldController();
  }

  bool isSubmited(bool flag) {
    isSubmit.value = flag;
    return isSubmit.value;
  }

  void setTextFieldController() {
    occupationEditingController.text = "Designer";
    employeeEditingController.text = "Quik Pay";
    phoneNumberEditingController.text = "876-123-4567";
    emaileEditingController.text = "andrea@test.com";
    addressEditingController.text = "Lot 107 Kings Ave, Sunny Side";
    cityEditingController.text = "Linstead PO";
    countryEditingController.text = "Jamaica";
    fullNameEditingController.text = "Jane Doe";
  }
}
