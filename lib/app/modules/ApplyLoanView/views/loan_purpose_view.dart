import 'package:byitpay/app/modules/ApplyLoanView/controllers/apply_loan_view_controller.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoanPurposeView extends GetView<ApplyLoanViewController> {
  const LoanPurposeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(backPress: () {
        Get.back();
      }),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                  title: "Let’s get started!",
                  subTitle:
                      "What is the purpose of the loan you are applying for? "),
              const SizedBox(
                height: 16,
              ),
              Obx(() => CustomDropDown(
                    title: "Debt Consolidation",
                    item: controller.items,
                    selectedOption: controller.selectedOption.value,
                    onchange: (String? value) {
                      controller.selectedOption.value = value!;
                    },
                  )),
              const SizedBox(
                height: 16,
              ),
              const CustomText(
                  text: "How long have you resided at your current address?",
                  fontSize: 14),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: EditTextField(
                      lable: "Years",
                      suffixIcon: MyAssets.cancle,
                      controller: controller.editingController,
                      isSecure: false,
                      showSuffixIcon: false,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: EditTextField(
                      lable: "Months",
                      suffixIcon: MyAssets.cancle,
                      controller: controller.editingController,
                      isSecure: false,
                      showSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => CustomDropDown(
                    title: "Do you rent or own?",
                    item: controller.rentItems,
                    selectedOption: controller.selectedOption2.value,
                    onchange: (String? value) {
                      controller.selectedOption2.value = value!;
                    },
                  )),
              const SizedBox(
                height: 16,
              ),
              const CustomText(
                  text: "What is your monthly housing cost?", fontSize: 14),
              const SizedBox(
                height: 16,
              ),
              EditTextField(
                lable: "Years",
                suffixIcon: MyAssets.cancle,
                controller: controller.costEditController,
                isSecure: false,
                showSuffixIcon: false,
                showLabel: false,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: "Status", fontSize: 14),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(() => CustomDropDown(
                              title: "Gender",
                              item: controller.genderItems,
                              selectedOption:
                                  controller.genderSelectedOption.value,
                              onchange: (String? value) {
                                controller.genderSelectedOption.value = value!;
                              },
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                            text: "No. of dependents", fontSize: 14),
                        const SizedBox(
                          height: 16,
                        ),
                        EditTextField(
                          lable: "121",
                          suffixIcon: MyAssets.cancle,
                          controller: controller.noOfDependsEditController,
                          isSecure: false,
                          showSuffixIcon: false,
                          showLabel: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryButton(
                  title: "Next",
                  onPress: () {
                    Get.toNamed(Routes.HOWMUCH);
                  })
            ],
          )),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.item,
      required this.selectedOption,
      required this.onchange,
        this.labelText,
      this.label = true});

  final String title;
  final List<String> item;
  final String selectedOption;
  final ValueChanged<String?> onchange;
  final bool? label;
  final CustomText? labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: primaryColor.withOpacity(0.07))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          label == false
              ? const Text(
                  "",
                  style: TextStyle(fontSize: 0),
                )
              : labelText ?? CustomText(text: title, fontSize: 14),
          DropdownButton<String>(
            isDense: true,

            isExpanded: true,
            icon: SvgPicture.asset(
              MyAssets.dropdown,
              color: Colors.black,
            ),
            underline: Container(),

            // Step 3.
            value: selectedOption,
            // Step 4.
            items: item.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: onchange,
          ),
        ],
      ),
    );
  }
}
