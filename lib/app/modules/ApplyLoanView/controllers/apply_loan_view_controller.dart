import 'package:byitpay/model/PersonalInfoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApplyLoanViewController extends GetxController {
  //TODO: Implement ApplyLoanViewController
  RxBool fiveMonth = true.obs;
  RxBool fourMonth = false.obs;

  final List<String> items = [
    'Consoldate credit cards or multiple loans',
    'Option 2',
    'Option 3',
    'Option 4'
  ];
  final List<String> rentItems = [
    'Rent',
    'Own',
  ];
  final List<String> durationItems = [
    '5+ Years',
    '10+ Years',
  ];
  final List<String> genderItems = [
    'Single',
    'Married',
  ];
  final List<String> employeItems = [
    'Employee full time',
    'Employee part time',
  ];

  final List<String> salaryDeductionItems = [
    'Withdraw payment from your paycheck',
    'Withdraw payment from your bank',
  ];
  RxBool isChecked = true.obs;
  RxString selectedOption = 'Consoldate credit cards or multiple loans'.obs;
  RxString selectedOption2 = 'Rent'.obs;
  RxString genderSelectedOption = 'Single'.obs;
  RxString emplyeSelectedOption = 'Employee full time'.obs;
  RxString durationSelectedOption = '5+ Years'.obs;
  RxString dedcutionSelectedOption = 'Withdraw payment from your paycheck'.obs;
  TextEditingController editingController = TextEditingController();
  TextEditingController costEditController = TextEditingController();
  TextEditingController noOfDependsEditController = TextEditingController();

  TextEditingController loanAmountEditingController = TextEditingController();
  TextEditingController paymentAmountEditingController =
      TextEditingController();
  TextEditingController amountEditingController = TextEditingController();
  TextEditingController salryEditingController = TextEditingController();

  List<PersonalInfoModel> itemList = [
    PersonalInfoModel(title: "Full Legal Name", subTitle: "Andrea Plummer"),
    PersonalInfoModel(title: "Date of Birth", subTitle: "July 30 1985"),
    PersonalInfoModel(
        title: "Home Address",
        subTitle: "Lot 107 Kings Ave, Atlanta GA, 30331 United States Jamaica")
  ];
  List<PersonalInfoModel> confirmLoanList = [
    PersonalInfoModel(title: "Loan Amount", subTitle: "\$30,000"),
    PersonalInfoModel(title: "Loan Terms", subTitle: "5 Months"),
    PersonalInfoModel(title: "Repayment Frequency", subTitle: "Monthly")
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
