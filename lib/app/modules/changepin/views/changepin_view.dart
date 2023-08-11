import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';

import 'package:byitpay/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/changepin_controller.dart';

class ChangepinView extends GetView<ChangepinController> {
  const ChangepinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          backPress: () {
            Get.back();
          },
          text: controller.titleList[controller.status.value],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CustomText(
                      textAlign: TextAlign.left,
                      text: controller.messageList[controller.status.value],
                      fontSize: 15)),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 360,
                child: PinCodeWidget(
                  controller: controller,
                  onCountReached: (int count) {
                    controller.count.value = count;
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: PrimaryButton(
                    title: "Continue",
                    onPress: () {
                      if (controller.count >= 3) {
                        controller.clears.value =
                            controller.clears.map((e) => true).toList();
                        controller.actives.value =
                            controller.actives.map((e) => false).toList();
                        controller.currentIndex.value = 0;
                        controller.inputText = "";

                        if (controller.status.value <= 2) {
                          if (controller.status.value == 2) {
                          } else {
                            controller.status.value =
                                controller.status.value + 1;

                            controller.setStatus(controller.status.value);
                          }
                        } else {
                          debugPrint("Compltede");
                        }
                      }
                    }),
              ),
              const SizedBox(
                height: 62,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PinCodeWidget extends GetView {
  const PinCodeWidget(
      {super.key, required this.controller, required this.onCountReached});

  @override
  final ChangepinController controller;
  final Function(int) onCountReached;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < controller.actives.length; i++)
                  ChangePinAnimatedBox(
                    clear: controller.clears[i],
                    actives: controller.actives[i],
                    value: controller.value[i],
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7 / 0.5,
                ),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(4.0),
                  // color: white,
                  child: index == 9
                      ? const Text("")
                      : Center(
                          child: MaterialButton(
                            elevation: 0,
                            splashColor: activePin,
                            highlightColor: activePin,
                            onPressed: () {
                              if (index == 11) {
                                controller.inputText = controller.inputText
                                    .substring(
                                        0, controller.inputText.length - 1);
                                controller.clears.value = controller.clears
                                    .map((e) => false)
                                    .toList();

                                if (controller.currentIndex.value >= 0) {
                                  controller.clears[
                                      controller.currentIndex.value - 1] = true;
                                  controller.actives[
                                          controller.currentIndex.value - 1] =
                                      false;
                                } else {
                                  controller.currentIndex.value = 0;
                                }
                                controller.currentIndex.value--;

                                return;
                              } else {
                                controller.inputText += controller
                                    .numbers[index == 10 ? index - 1 : index]
                                    .toString();
                              }
                              if (controller.inputText.length == 3) {
                                onCountReached(controller.inputText.length);
                                debugPrint("Compltede");
                                ("LENGTH${controller.inputText.length}");

                                // controller.clears.value =
                                //     controller.clears.map((e) => true).toList();
                                // controller.actives.value = controller.actives
                                //     .map((e) => false)
                                //     .toList();
                                // controller.currentIndex.value = 0;
                                // controller.inputText = "";
                                return;
                              }
                              controller.clears.value =
                                  controller.clears.map((e) => false).toList();
                              controller
                                      .actives[controller.currentIndex.value] =
                                  true;
                              controller.currentIndex.value++;
                            },
                            minWidth: 65,
                            height: 70,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            color: index == 11 ? null : Colors.white,
                            child: index == 11
                                ? const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                    size: 32,
                                  )
                                : Text(
                                    '${controller.numbers[index == 10 ? index - 1 : index]}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                          ),
                        ),
                ),
                itemCount: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePinAnimatedBox extends StatefulWidget {
  const ChangePinAnimatedBox(
      {super.key, this.clear = false, this.actives = false, this.value = 1});

  final bool clear;
  final bool actives;
  final int value;

  @override
  State<ChangePinAnimatedBox> createState() => _ChangePinAnimatedBoxState();
}

class _ChangePinAnimatedBoxState extends State<ChangePinAnimatedBox>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      animationController.forward(from: 0);
    }
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Container(
        margin: const EdgeInsets.all(6.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.actives ? activePin : primaryColor,
              ),
            ),
            Align(
              alignment:
                  Alignment(0, animationController.value / widget.value - 1),
              child: Opacity(
                opacity: 1 - animationController.value,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.actives ? activePin : primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
