import 'package:byitpay/model/DetailsModel.dart';
import 'package:byitpay/model/LaonModel.dart';
import 'package:get/get.dart';

class LoanController extends GetxController {
  List<DetailsModel> itemList = [
    DetailsModel(
        title: "Loan Status", leading: "", isButton: true, isIcon: false),
    DetailsModel(
        title: "Due on",
        leading: "Feb 02, 2021",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "Loan Number",
        leading: "BYLKGJ10",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "Interest Rate",
        leading: "17.5 %",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "Loan Term",
        leading: "8 Months",
        isButton: false,
        isIcon: false),
  ];
  List<DetailsModel> balanceDetailsList = [
    DetailsModel(
        title: "Original Loan Amount",
        leading: "\$37,500 JMD",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "Principal",
        leading: "\$945 JMD",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "Origination Fee",
        leading: "\$1,125 JMD",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "Remaining Balance",
        leading: "\$6,250 JMD",
        isButton: false,
        isIcon: false),
    DetailsModel(
        title: "See my payoff amount",
        leading: "8 Months",
        isButton: false,
        isIcon: true),
  ];
  List<DetailsModel> documentList = [
    DetailsModel(
        title: "Loan Documents", leading: "", isButton: false, isIcon: true),
    DetailsModel(
        title: "Statement Activity",
        leading: "",
        isButton: false,
        isIcon: true),
  ];

  List<LoanModel> modelList = [
    LoanModel(
        amount: "\$5,400",
        paidAmount: "\$945",
        code: "BYLKGJ10",
        money: "\$6250/month",
        loanTerm: "8 months",
        status: "1 month left",
        interest: "17.5%",
        isPaid: false),
    LoanModel(
        amount: "\$10,000",
        paidAmount: "\$300",
        code: "BYLTYZ23",
        money: "\$2800/month",
        loanTerm: "4 months",
        status: "PENDING APPROVAL",
        interest: "12%",
        isPaid: false),
    LoanModel(
        amount: "\$0",
        paidAmount: "\$0",
        code: "BYLAPL90",
        money: "\$0/month",
        loanTerm: "2 months",
        status: "PAID IN FULL",
        interest: "17.5%",
        isPaid: true),
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
