import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/accountInfo/views/name_change_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/signup/controllers/signup_controller.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class PersonalVerifyIdentityView extends GetView<SignupController> {
  const PersonalVerifyIdentityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Stack(children: [
           Container(
             width: 88,
             height: 8,
             decoration: BoxDecoration(
             color: activePin.withOpacity(0.5),
             borderRadius: BorderRadius.circular(30),
           ),),
          Container(
            width: 44,
            height: 8,
            decoration: BoxDecoration(
              color: activePin,
              borderRadius: BorderRadius.circular(30),
            ),),
        ],),

        leading: IconButton(
            onPressed: () {
            Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: monochrome,
            )),
        elevation: 0,
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(27),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrimaryText(title: "Verify Identity", subTitle: "It’s required by law to verify your identity as a new user.")
          ,
          const SizedBox(
            height: 28,
          ),

          Center(
            child: DocumentCard(
              heading: "Government ID",
              message:
              "Take a driver’s license,national identity card or passport photo",
              isShowText: false,
              iconColor: green,
              iconPath: MyAssets.greenTick,
              onTab: () {
                _showBottomSheet(context);
              }
            ),
          ),
          Center(
            child: DocumentCard(
              heading: "Proof of change",
              message: "Please uplaod documents to verify name change.",
              isShowText: true,
              iconColor: darkBlue,

              iconPath: MyAssets.bluePlus,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          PrimaryButton(
            title: "Continue",
            onPress: () {
              Get.toNamed(Routes.TAKESELFIE);

            },
            fontWeight: FontWeight.w600,
          )
        ],
        ),
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,

      context: context,
      builder: (BuildContext context) {
        return SizedBox(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 51, height: 4,
                decoration: BoxDecoration(

                    color: white,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight:  Radius.circular(12))
                ),


                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 3,),
                    const CustomText(
                      text: 'Let’s get you verified!',
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      fontSize: 20,
                      letterSpacing: -0.14,
                    ),
                    const SizedBox(height: 8,),
                    const CustomText(
                      text: 'Which photo ID whould you like to use?',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      textAlign: TextAlign.left,
                      letterSpacing: -0.2,
                      color: monochrome,
                    ),
                    const SizedBox(height: 24,),

                    ListTile(
                      horizontalTitleGap: 16,
                      onTap: (){},
                      contentPadding: EdgeInsets.zero,

                      trailing: Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 7),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                              decoration: BoxDecoration(

                                  color: activePin.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const CustomText(
                                text: "Preferred",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: activePin,
                              ),
                            ),

                            const Icon(Icons.arrow_forward_ios_rounded, color: grey,size: 20,),


                          ],
                        ),
                      ),
                      leading: SvgPicture.asset(MyAssets.idCard),
                      title:  const CustomText(
                        textAlign: TextAlign.start,
                        text: "Driver's License", fontSize: 17, fontWeight: FontWeight.w600,letterSpacing: -0.4,),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(),
                    ),
                    ListTile(
                      horizontalTitleGap: 16,
                      contentPadding: EdgeInsets.zero,
                      onTap: (){},
                      trailing: Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 7),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                              decoration: BoxDecoration(

                                  color: activePin.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const CustomText(
                                text: "Preferred",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: activePin,
                              ),
                            ),

                            const Icon(Icons.arrow_forward_ios_rounded, color: grey,size: 20,),


                          ],
                        ),
                      ),
                      leading: SvgPicture.asset(MyAssets.passport),
                      title:  const CustomText(
                        textAlign: TextAlign.start,
                        text: "National Identity Card", fontSize: 17, fontWeight: FontWeight.w600,letterSpacing: -0.4,),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(),
                    ),
                    ListTile(
                      horizontalTitleGap: 16,
                      onTap: (){},
                      contentPadding: EdgeInsets.zero,

                      trailing:  const Icon(Icons.arrow_forward_ios_rounded, color: grey,size: 20,),
                      leading: SvgPicture.asset(MyAssets.driver),
                      title:  const CustomText(
                        textAlign: TextAlign.start,
                        text: "Passport", fontSize: 17, fontWeight: FontWeight.w600,letterSpacing: -0.4,),
                    ),


                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}




