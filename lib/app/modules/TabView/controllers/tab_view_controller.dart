import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/details_model.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:byitpay/model/profile_model.dart';
import 'package:get/get.dart';

class TabViewController extends GetxController {
  List<String> statementList = [
    "January 2022",
    "February 2022",
    "March 2022",
    "April 2022",
    "May 2022",
    "June 2022",
  ];

  List<ProfileModel> profileModel = [
    ProfileModel(
        leadingIcon: MyAssets.info, title: "Account Info", ishowDivider: false),
    ProfileModel(
        leadingIcon: MyAssets.loan,
        title: "Personal Loan",
        ishowDivider: false,
        color: purple),
    ProfileModel(
        leadingIcon: MyAssets.payment,
        title: "Payments",
        ishowDivider: true,
        color: activePin),
    ProfileModel(
        leadingIcon: MyAssets.setting,
        title: "General Setting",
        ishowDivider: false),
    ProfileModel(
        leadingIcon: MyAssets.lockgreen,
        title: "Change Login in PIN",
        ishowDivider: false),
    ProfileModel(
        leadingIcon: MyAssets.document, title: "Documents", ishowDivider: true),
    ProfileModel(
        leadingIcon: MyAssets.help,
        title: "Customer Support",
        ishowDivider: false,
        color: activePin),
    ProfileModel(
        leadingIcon: MyAssets.logout, title: "Log Out", ishowDivider: false),
  ];
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

  RxInt currentIndex = 0.obs;

  final count = 0.obs;

  void onTabTapped(int index) {
    currentIndex.value = index;
  }

  void increment() => count.value++;
}
