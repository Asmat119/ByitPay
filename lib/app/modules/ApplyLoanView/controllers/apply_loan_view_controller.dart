import 'package:byitpay/model/personal_Info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApplyLoanViewController extends GetxController {
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
  final List<String> loanTermsItems = [
    '1 month',
    '2 month',
    '1 year',
  ];
  final List<String> durationItems = [
    '1+ Years',
    '5+ Years',
    '10+ Years',
  ];
  final List<String> genderItems = [
    'Single',
    'Married',
  ];
  final List<String> employeItems = [

    'Employed Full Time',
    'Employed Part Time',
  ];

  final List<String> salaryDeductionItems = [
    'Salary Deduction'
    'Automatic Payment From Bank',
    'Manual Payments',
  ];
  RxBool isChecked = true.obs;
  RxString selectedOption = 'Consoldate credit cards or multiple loans'.obs;
  RxString selectedOption2 = 'Rent'.obs;
  RxString genderSelectedOption = 'Single'.obs;
  RxString loanTermSelectedOption = '1 month'.obs;
  RxString emplyeSelectedOption = 'Employed Full Time'.obs;
  RxString durationSelectedOption = '1+ Years'.obs;
  RxString dedcutionSelectedOption = 'Salary Deduction'.obs;
  TextEditingController editingController = TextEditingController();
  TextEditingController costEditController = TextEditingController();
  TextEditingController noOfDependsEditController = TextEditingController();

  TextEditingController loanAmountEditingController = TextEditingController();
  TextEditingController monthEditingController = TextEditingController();
  TextEditingController yearEditingController = TextEditingController();
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

  void increment() => count.value++;
}
