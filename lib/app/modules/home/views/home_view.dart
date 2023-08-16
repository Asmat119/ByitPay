
import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    statusBar2();
    var pageIndex = 0.obs;
    final List<Widget> demo = [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(image: AssetImage(MyAssets.slider1)),
          const Text(
            'Personal Loans made easy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Add your debit card or bank account and \nchoose which you want to use at anytime. ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(image: AssetImage(MyAssets.slider1)),
          const Text(
            'Personal Loans made easy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Add your debit card or bank account and \nchoose which you want to use at anytime. ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(image: AssetImage(MyAssets.slider1)),
          const Text(
            'Personal Loans made easy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Add your debit card or bank account and \nchoose which you want to use at anytime. ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),

      // Container(height: 300, color: Colors.black),
      // Container(height: 300, color: Colors.blue),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Obx(
              () =>
              Column(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: activePin,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: .6.sh,
                    width: double.infinity,
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      children: demo,
                      onPageChanged: (index) {
                        pageIndex.value = index;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CarouselIndicator(
                    width: 40,
                    height: 5,
                    color: Colors.black12,
                    activeColor: activePin,
                    count: demo.length,
                    index: pageIndex.value,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  // Obx(() {
                  //   return Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 120.0),
                  //         child: ElevatedButton(
                  //
                  //           onPressed: () {
                  //             controller.isLoginClick.value = false;
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //
                  //             // foregroundColor: white,
                  //             backgroundColor: !controller.isLoginClick.value
                  //                 ? primaryColor
                  //                 : controller.disableColor.value,
                  //             minimumSize: const Size(128, 48),
                  //             elevation: 0,
                  //             padding: const EdgeInsets.symmetric(horizontal: 16),
                  //             shape: const RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.all(
                  //                   Radius.circular(100)),
                  //             ),
                  //           ),
                  //           child: Text(
                  //             'Sign up',
                  //             style: GoogleFonts.inter(
                  //               fontSize: 18,
                  //               color: !controller.isLoginClick.value
                  //                   ? white
                  //                   : lightText,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(right: 120.0),
                  //         child: ElevatedButton(
                  //
                  //           onPressed: () {
                  //             controller.isLoginClick.value = true;
                  //             // Get.toNamed(Routes.LOGIN);
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //             foregroundColor: white,
                  //             backgroundColor: controller.isLoginClick.value
                  //                 ? primaryColor
                  //                 : controller.disableColor.value,
                  //             minimumSize: const Size(128, 48),
                  //             elevation: 0,
                  //             padding: const EdgeInsets.symmetric(horizontal: 16),
                  //             shape: const RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.all(
                  //                   Radius.circular(100)),
                  //             ),
                  //           ),
                  //           child: Text('Login', style: GoogleFonts.inter(
                  //             fontSize: 18,
                  //             color: controller.isLoginClick.value
                  //                 ? white
                  //                 : lightText,
                  //             fontWeight: FontWeight.w600,
                  //           ),),
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   );
                  // }),
                  // ),
          ToggleButton(),


                ],
              ),
        ),
      ),
    );
  }
}
class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 220.0;
const double height = 48.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = lightText;


class _ToggleButtonState extends State<ToggleButton> {
   double xAlign = loginAlign;
   Color loginColor = selectedColor;
   Color signInColor = normalColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0XFFF9FAFB),
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(xAlign, 0),
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: width * 0.5,
                  height: height,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = loginAlign;
                    loginColor = selectedColor;
                    signInColor = normalColor;
                    Get.offAndToNamed(Routes.LOGIN);
                  });
                },
                child: Align(
                  alignment: const Alignment(-1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: loginColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = signInAlign;
                    signInColor = selectedColor;

                    loginColor = normalColor;
                    Get.offAndToNamed(Routes.SIGNUP);
                  });
                },
                child: Align(
                  alignment: Alignment(1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: signInColor,
                        fontWeight: FontWeight.w600

                      ),
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