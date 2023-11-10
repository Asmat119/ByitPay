import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/constants_keys.dart';
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryText(
                        title: "Loan Overview",
                        subTitle:
                            "Does this look correct? Please verify and confirm your loan details."),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        controller.confirmLoanList.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTileWithEditButton(
                              title: controller.confirmLoanList[index].title,
                              subTitle: controller.confirmLoanList[index].subTitle,
                              onTab: (){},

                            ),
                            index <= 1 ? const Divider() : const Text(""),
                          ],
                        ),
                      ),
                    ),
                    const CustomText(
                        text: MyConstants.iagree,
                        fontSize: 14,
                        textAlign: TextAlign.left,
                        letterSpacing: -0.32,
                        fontWeight: FontWeight.w500),
                    Obx(() => Padding(
                          padding: const EdgeInsets.only(bottom: 18, top: 31),
                          child: Row(
                            children: [
                              RectangularCheckbox(
                                value: controller.isChecked.value,
                                onChanged: (value) {
                                  controller.isChecked.value = value;
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: "I agree",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            PrimaryButton(
                title: "See Offers",
                onPress: () => Get.toNamed(Routes.SELECTOFFER))
          ],
        ),
      ),
    );
  }
}

class ListTileWithEditButton extends StatelessWidget {
  const ListTileWithEditButton({
    super.key,
     required this.title, required this.subTitle, required this.onTab,

  });

  final String title;
  final String subTitle;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      contentPadding: const EdgeInsets.all(0),
      title: CustomText(
        text: title,
        fontSize: 14,
        color: lightText,
        textAlign: TextAlign.left,
        letterSpacing: -0.16,
        fontWeight: FontWeight.w600,
      ),
      subtitle: CustomText(
        text:
            subTitle,
        fontSize: 16,
        color: disbaleTextColor,
        textAlign: TextAlign.left,
        letterSpacing: -0.4,
        fontWeight: FontWeight.w600,
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
        onPressed: onTab,
        child: const CustomText(
          text: "Edit",
          fontSize: 14,
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {},
    );
  }
}

class RectangularCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const RectangularCheckbox(
      {super.key, required this.value, required this.onChanged});

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
