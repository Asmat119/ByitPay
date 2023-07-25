import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoanOverviewView extends GetView<ApplyLoanViewController> {
  const LoanOverviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () {
        Get.back();
      }),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const PrimaryText(
                      title: "Loan Overview",
                      subTitle:
                          "Does this look correct? Please verify and confirm your loan details."),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: List.generate(
                      controller.confirmLoanList.length,
                      (index) => Column(
                        children: [
                          ListTile(
                            enabled: false,
                            isThreeLine: true,
                            contentPadding: const EdgeInsets.all(0),
                            title: CustomText(
                              text: controller.confirmLoanList[index].title,
                              fontSize: 14,
                              color: lightText,
                              textAlign: TextAlign.left,
                            ),
                            subtitle: CustomText(
                              text: controller.confirmLoanList[index].subTitle,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.left,
                            ),
                            trailing: ElevatedButton(
                              style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) {
                                      return states
                                              .contains(MaterialState.pressed)
                                          ? grey.withOpacity(0.5)
                                          : null;
                                    },
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      primaryColor.withOpacity(0.04)),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)))),
                              onPressed: () {
                                print("object");
                              },
                              child: CustomText(
                                text: "Edit",
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              // Add your onTap logic here
                              print('Tapped on ${"hazra"}');
                            },
                          ),
                          index <= 1 ? const Divider() : const Text(""),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomText(
              text:
                  "I agree that all info provided in this loan application is true and complete. I understand Bylt Pay will rely on the information to decide on this app. I authorize and consent Bylt Pay gather more info about me and to share my info as allowed by law once i submit this application.",
              fontSize: 14,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 12,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(8),
            //   child: SizedBox(
            //     height: 18,
            //     child: Obx(() => Theme(
            //           data: Theme.of(context).copyWith(
            //             unselectedWidgetColor: Colors.black,
            //             toggleableActiveColor: Colors.orange.shade800,
            //           ),
            //           child: Checkbox(
            //             splashRadius: 8,
            //             checkColor: Colors.black,
            //             side: BorderSide.none,
            //             overlayColor: MaterialStateProperty.all(grey),
            //             fillColor: MaterialStateProperty.all(activePin),
            //             visualDensity: VisualDensity.standard,
            //             shape: RoundedRectangleBorder(
            //                 side: BorderSide(width: 0.7, color: activePin),
            //                 borderRadius: BorderRadius.circular(2)),
            //             value: controller.isChecked.value,
            //             onChanged: (bool? value) {
            //               controller.isChecked.value = value!;
            //             },
            //             activeColor: activePin,
            //           ),
            //         )),
            //   ),
            // ),
            Obx(() => RectangularCheckbox(
                  value: controller.isChecked.value,
                  onChanged: (value) {
                    controller.isChecked.value = value;
                  },
                )),
            PrimaryButton(
                title: "See Offer",
                onPress: () => Get.toNamed(Routes.SELECTOFFER))
          ],
        ),
      ),
    );
  }
}

class RectangularCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  RectangularCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: activePin,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: value
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
