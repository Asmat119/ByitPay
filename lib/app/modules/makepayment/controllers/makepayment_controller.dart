import 'package:byitpay/main.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MakepaymentController extends GetxController {
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  Rx<TextEditingController> cityEditingController = TextEditingController().obs;
  Rx<TextEditingController> stateEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> countryEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> postalEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> expDateEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> cvvEditingController = TextEditingController().obs;
  Rx<TextEditingController> numberEditingController =
      TextEditingController().obs;

  RxString emaiText = "".obs;
  RxString cityText = "".obs;
  RxString stateText = "".obs;
  RxString countryText = "".obs;
  RxString postalText = "".obs;
  RxString expDateText = "".obs;
  RxString cvvText = "".obs;
  RxString numberText = "".obs;
  RxBool isButtonDisable = false.obs;
  final count = 0.obs;

  RxList<String> list =
      ['Bank transfer or deposit', 'Credit or debit card'].obs;

  RxString dropdownValue = "Bank transfer or deposit".obs;

  List<String> bankDetailList = [
    'National Commercial Bank (NCB) Account #: 123-456-789',
    'Bank of Nova Scotia (BNS) Account #: 123-456-78',
    'Jamaica National Building Society (JNBS) Account #: 123-456-78'
  ];
  LoanModel loanModel =
  LoanModel(
  amount: "\$5,400",
  paidAmount: "\$945",
  code: "BYLKGJ10",
  money: "\$6250/month",
  loanTerm: "8 months",
  status: "1 month left",
  interest: "17.5%",
  isPaid: false);

  @override
  void onInit() {
    super.onInit();
    textEditingController.value.text = "Lot 107 Kings Ave, Sunny Side";
    statusBarDark();
  }
  //
  // void dispose() {
  //   numberEditingController.value.dispose();
  //   postalEditingController.value.dispose();
  //   expDateEditingController.value.dispose();
  //   countryEditingController.value.dispose();
  //   cvvEditingController.value.dispose();
  //   stateEditingController.value.dispose();
  //   postalEditingController.value.dispose();
  //
  // }

  void increment() => count.value++;
}
