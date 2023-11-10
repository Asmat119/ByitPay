import 'package:byitpay/app/modules/home/model/HomeCardModel.dart';
import 'package:byitpay/constants/constants_keys.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:byitpay/model/details_model.dart';
import 'package:byitpay/model/help_model.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:byitpay/model/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TabViewController extends GetxController {
  Rx<PersistentTabController> persistentTabController =
      PersistentTabController(initialIndex: 0).obs;
  List<String> statementList = [
    "January 2022",
    "February 2022",
    "March 2022",
    "April 2022",
    "May 2022",
    "June 2022",
  ];
  List<HelpModel> helperList = [
    HelpModel(heading: MyConstants.heading1, message: MyConstants.msg1),
    HelpModel(heading: MyConstants.heading2, message: MyConstants.msg2),
    HelpModel(heading: MyConstants.heading3, message: MyConstants.msg3),
  ];
  Rx<TextEditingController> searchEditingController =
      TextEditingController().obs;
  RxString searchText = "".obs;

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

  List<HomeCardModel> homeModel = [
    HomeCardModel(
        date: "Aug 10, 2023",
        loanTitle: "Money Transfer",
        loanSubTitle: "Disbursement",
        amount: "\$30,000",
        loanID: "Loan ID: BYLP258",
        iconPath: MyAssets.money
    ),
    HomeCardModel(
        date: "Aug 10, 2023",
        loanTitle: "Loan Payment",
        loanSubTitle: "Bank transfer",
        amount: "-\$2,500",
        loanID: "Loan ID: BYLP258",
        iconPath: MyAssets.loan
    ),
    HomeCardModel(
        date: "Jul 1, 2023",
        loanTitle: "Loan Payment",
        loanSubTitle: "Debit or Credit Card",
        amount: "\$30,000",
        loanID: "Loan ID: BYLP258",
        iconPath: MyAssets.loan
    ),
    HomeCardModel(
        date: "Jul 1, 2023",
        loanTitle: "Loan Payment",
        loanSubTitle: "Debit or Credit Card",
        amount: "\$30,000",
        loanID: "Loan ID: BYLP258",
        iconPath: MyAssets.loan
    ),

    HomeCardModel(
        date: "Jul 1, 2023",
        loanTitle: "Loan Payment",
        loanSubTitle: "Debit or Credit Card",
        amount: "\$30,000",
        loanID: "Loan ID: BYLP258",
        iconPath: MyAssets.loan
    ),
  ];

  RxInt currentIndex = 0.obs;

  final count = 0.obs;

  void onTabTapped(int index) {
    currentIndex.value = index;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: index == 2 ? white : primaryColor,
        statusBarIconBrightness:
            index == 2 ? Brightness.dark : Brightness.light));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    statusBarDark();
  }

  void increment() => count.value++;
}
