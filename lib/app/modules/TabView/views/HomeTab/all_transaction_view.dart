import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/home/model/HomeCardModel.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class AllTransactionView extends GetView {
   AllTransactionView({Key? key}) : super(key: key);
  List<HomeCardModel> arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    statusBarLight();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(backPress: () {
        Get.back();
      },
      text: "Transactions",
      ),
      body:  Column(
        children:[

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 27.0),
               child: SearchBar(
                 hintText: "Search by date or Loan ID",

                 hintStyle: MaterialStateProperty.all(const TextStyle(color: grey, fontWeight: FontWeight.w400)),
                 constraints: const BoxConstraints( maxHeight: 44, minHeight: 44),
                 shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                 elevation: MaterialStateProperty.all(4),
                 shadowColor: MaterialStateProperty.all(lightGrey.withOpacity(0.4)),
               leading: SvgPicture.asset(MyAssets.search),
           ),
             ),
          const SizedBox(height: 18,),


          Expanded(
            child: ListView.builder(

                itemCount: arg.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27.0),
                    child: InkWell(
                        onTap: (){
                          Get.toNamed(Routes.RECEIPT);
                        },
                        child: TransactionHistoryCard(arg[index])),
                  );
            }),
          ),



          ],
      ),
    );
  }
}
