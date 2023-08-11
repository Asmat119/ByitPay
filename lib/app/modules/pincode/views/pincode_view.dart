// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/pincode_controller.dart';

class PincodeView extends GetView<PincodeController> {
  PincodeView({Key? key}) : super(key: key);
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var inputText = "";
  var actives = [false, false, false, false].obs;
  var clears = [false, false, false, false].obs;
  var value = [1, 2, 3, 2];
  var currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000032),
      body: Obx(
        () => Column(
          children: [
            Text(currentIndex.value.toString()),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/logo.png'),
                    width: .3.sw,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Enter your code',
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < actives.length; i++)
                          AnimatedBox(
                            clear: clears[i],
                            actives: actives[i],
                            value: value[i],
                          ),
                      ],
                    ),
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
                        ? IconButton(
                            onPressed: () async {
                              bool isAuthenticated =
                                  await AuthService.authenticateUser();
                              if (isAuthenticated) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text('Authentication Success.'),
                                //   ),
                                // );
                                statusBar2();
                                Get.offAllNamed(Routes.HOME);
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Authentication failed.'),
                                  ),
                                );
                              }
                            },
                            icon: SvgPicture.asset(
                              MyAssets.fingerprint,

                              // Icons.fingerprint,
                              // color: activePin,
                              // size: 44,
                            ),
                          )
                        : Center(
                            child: MaterialButton(
                              onPressed: () {
                                if (index == 11) {
                                  inputText = inputText.substring(
                                      0, inputText.length - 1);
                                  clears.value =
                                      clears.map((e) => false).toList();

                                  if (currentIndex.value >= 0) {
                                    clears[currentIndex.value - 1] = true;
                                    actives[currentIndex.value - 1] = false;
                                  } else {
                                    currentIndex.value = 0;
                                  }
                                  currentIndex.value--;

                                  return;
                                } else {
                                  inputText +=
                                      numbers[index == 10 ? index - 1 : index]
                                          .toString();
                                }
                                if (inputText.length == 4) {
                                  if (inputText == "1234") {
                                    statusBar2();
                                    Get.offAllNamed(Routes.HOME);
                                    debugPrint('Success');
                                    // return;
                                  }
                                  clears.value =
                                      clears.map((e) => true).toList();
                                  actives.value =
                                      actives.map((e) => false).toList();
                                  currentIndex.value = 0;
                                  inputText = "";
                                  return;
                                }
                                clears.value =
                                    clears.map((e) => false).toList();
                                actives[currentIndex.value] = true;
                                currentIndex.value++;
                              },
                              minWidth: 65,
                              height: 70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              color: index == 11 ? null : Colors.white12,
                              child: index == 11
                                  ? const Icon(
                                      Icons.backspace,
                                      color: Colors.white,
                                      size: 32,
                                    )
                                  : Text(
                                      '${numbers[index == 10 ? index - 1 : index]}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                            ),
                          ),
                  ),
                  itemCount: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBox extends StatefulWidget {
  const AnimatedBox(
      {super.key, this.clear = false, this.actives = false, this.value});
  final clear;
  final actives;
  final value;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
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
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.actives ? activePin : white,
              ),
            ),
            Align(
              alignment:
                  Alignment(0, animationController.value / widget.value - 1),
              child: Opacity(
                opacity: 1 - animationController.value,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.actives ? activePin : white,
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
