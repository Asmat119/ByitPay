import 'package:byitpay/app/modules/TabView/controllers/tab_view_controller.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_document_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoanStatementView extends GetView<TabViewController> {
  const LoanStatementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        backPress: () {
          Get.back();
        },
        text: "Statements",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Column(
            children: List.generate(
                controller.statementList.length,
                (index) => StatementListTile(
                      title: controller.statementList[index],
                      onTab: () {},
                    )),
          ),
        ),
      ),
    );
  }
}
