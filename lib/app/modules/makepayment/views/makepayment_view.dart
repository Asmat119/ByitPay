import 'dart:developer';

import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/loan_details_view.dart';
import 'package:byitpay/app/modules/TabView/views/LoanTab/paymnet_view.dart';
import 'package:byitpay/app/modules/TabView/views/ProfileTab/views/profile_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/model/laon_model.dart';
import 'package:byitpay/widgets/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/makepayment_controller.dart';

class MakepaymentView extends GetView<MakepaymentController> {
  MakepaymentView({Key? key}) : super(key: key);
  final LoanModel model = Get.arguments;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: LoanPaymentCard(model: model),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Total: ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: -0.4,
                          )),
                      TextSpan(
                          text: '\$6250 JMD',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: activePin,
                            fontSize: 17,
                            letterSpacing: -0.4,
                          )),
                    ],
                  ),
                ),
                HighLightButton(
                  backgroundColor: green,
                  text: "Pay in full",
                  onTab: () {},
                  textColor: green,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: CustomText(
                text: "Payment method",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: lightText,
              ),
            ),
            Obx(() => CustomDropDown(
                  value: controller.dropdownValue.value,
                  list: controller.list,
                  onchange: (String? value) {
                    controller.dropdownValue.value = value!;
                  },
                )),
            const SizedBox(
              height: 14,
            ),
            Obx(() => Container(
                child: controller.dropdownValue.value == controller.list.first
                    ? BankTransferWidget(controller: controller)
                    : Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Billing Address",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: lightText,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            EditTextField(
                              controller:
                                  controller.textEditingController.value,
                              suffixIcon: MyAssets.cancle,
                              showSuffixIcon: false,
                              showLabel: false,
                              isSecure: false,
                              letterSpace: 0.3,
                              fontWeight: FontWeight.w600,
                              lable: "",
                              onChange: (value) {
                                controller.emaiText.value = value;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "City",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: lightText,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      EditTextField(
                                        controller: controller
                                            .cityEditingController.value,
                                        suffixIcon: MyAssets.cancle,
                                        showSuffixIcon: false,
                                        showLabel: false,
                                        isSecure: false,
                                        letterSpace: 0.3,
                                        fontWeight: FontWeight.w600,
                                        lable: "",
                                        onChange: (value) {
                                          debugPrint(value);
                                          controller.cityText.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "Pariah / State",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: lightText,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      EditTextField(
                                        controller: controller
                                            .stateEditingController.value,
                                        suffixIcon: MyAssets.cancle,
                                        showSuffixIcon: false,
                                        showLabel: false,
                                        isSecure: false,
                                        fontWeight: FontWeight.w600,
                                        letterSpace: 0.3,
                                        lable: "",
                                        onChange: (value) {
                                          controller.stateText.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "Country",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: lightText,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      EditTextField(
                                        controller: controller
                                            .countryEditingController.value,
                                        suffixIcon: MyAssets.cancle,
                                        showSuffixIcon: false,
                                        showLabel: false,
                                        isSecure: false,
                                        letterSpace: 0.3,
                                        fontWeight: FontWeight.w600,
                                        lable: "",
                                        onChange: (value) {
                                          debugPrint(value);
                                          controller.countryText.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "Postal / Zip code",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: lightText,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      EditTextField(
                                        controller: controller
                                            .postalEditingController.value,
                                        suffixIcon: MyAssets.cancle,
                                        showSuffixIcon: false,
                                        showLabel: false,
                                        textInputType: TextInputType.number,
                                        isSecure: false,
                                        fontWeight: FontWeight.w600,
                                        letterSpace: 0.3,
                                        lable: "",
                                        onChange: (value) {
                                          controller.postalText.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: CustomText(
                                text: "Card Number",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: lightText,
                              ),
                            ),
                            EditTextField(
                              controller:
                                  controller.numberEditingController.value,
                              suffixIcon: MyAssets.mastercard,
                              showLabel: false,
                              showSuffixIcon: true,
                              isSecure: false,
                              textInputType: TextInputType.number,
                              letterSpace: 0.3,
                              fontWeight: FontWeight.w600,
                              lable: "",
                              onChange: (value) {
                                controller.numberText.value = value;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "Expire Date mm/yy",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: lightText,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      EditTextField(
                                        controller: controller
                                            .expDateEditingController.value,
                                        suffixIcon: MyAssets.cancle,
                                        showSuffixIcon: false,
                                        showLabel: false,
                                        isSecure: false,
                                        letterSpace: 0.3,
                                        textInputType: TextInputType.number,
                                        fontWeight: FontWeight.w600,
                                        lable: "",
                                        onChange: (value) {
                                          debugPrint(value);
                                          controller.expDateText.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "CVV Code",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: lightText,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Obx(() => EditTextField(
                                            controller: controller
                                                .cvvEditingController.value,
                                            suffixIcon: MyAssets.cancle,
                                            showSuffixIcon: false,
                                            showLabel: false,
                                            textInputType: TextInputType.number,
                                            isSecure: false,
                                            fontWeight: FontWeight.w600,
                                            letterSpace: 0.3,
                                            lable: "",
                                            onChange: (value) {
                                              controller.cvvText.value = value;
                                              controller.cvvEditingController
                                                  .value.text = value;
                                            },
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 16),
                              child: Image.asset(
                                MyAssets.paymentcards,
                                height: 27,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: Obx(() => IgnorePointer(
                                    ignoring: controller.isButtonDisable.value,
                                    child: PrimaryButton(
                                      title: "Pay Now",
                                      onPress: () {
                                        log("object");

                                        setEmpty(controller: controller);
                                        Get.toNamed(Routes.RECEIPT);
                                      },
                                      color: isDisable(controller: controller)
                                          ? primaryColor
                                          : buttonDisbaleColor,
                                      textColor:
                                          isDisable(controller: controller)
                                              ? white
                                              : disbaleColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: () {
                                    log("Hazrat ${controller.cvvEditingController.value.text.length}");
                                    controller.cvvEditingController.value.text =
                                        "";
                                  },
                                  child: const CustomText(
                                    text: "Cancel Payment",
                                    fontSize: 15,
                                    color: activePin,
                                    fontWeight: FontWeight.w600,
                                  )),
                            )
                          ],
                        ),
                      ))),
          ],
        ),
      ),
    );
  }

  bool isDisable({required MakepaymentController controller}) {
    if (controller.expDateText.value.isNotEmpty &&
        controller.cityText.value.isNotEmpty &&
        controller.stateText.value.isNotEmpty &&
        controller.countryText.value.isNotEmpty &&
        controller.postalText.value.isNotEmpty &&
        controller.expDateText.value.isNotEmpty &&
        controller.cvvText.value.isNotEmpty &&
        controller.numberText.value.isNotEmpty) {
      controller.isButtonDisable.value = false;
      return true;
    }
    {
      controller.isButtonDisable.value = true;
      return false;
    }
  }

  void setEmpty({required MakepaymentController controller}) {
    controller.stateEditingController.value.text = "";
    controller.textEditingController.value.text = "";
    controller.countryEditingController.value.text = "";
    controller.stateEditingController.value.text = "";
    controller.postalEditingController.value.text = "";
    controller.cvvEditingController.value.text = "";
    controller.numberEditingController.value.text = "";
  }
}

class BankTransferWidget extends StatelessWidget {
  const BankTransferWidget({
    super.key,
    required this.controller,
  });

  final MakepaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            controller.bankDetailList.length,
            (index) => ProfileListTile(
              leadingIcon: MyAssets.loan,
              title: controller.bankDetailList[index],
              isShow: false,
              color: purple,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 47.0, vertical: 32),
          child: PrimaryButton(title: "Close", onPress: () {}),
        ),
      ],
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.value,
    required this.list,
    required this.onchange,
  });
  final String value;
  final List<String> list;
  final Function(String?) onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryColor.withOpacity(0.07))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            icon: SvgPicture.asset(
              MyAssets.dropdown,
              width: 17,
            ),
            elevation: 16,
            style: GoogleFonts.inter(
                color: dropDownTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            onChanged: onchange,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }
}
