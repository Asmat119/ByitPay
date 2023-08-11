import 'package:byitpay/app/routes/app_pages.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          () => Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: white,
                      backgroundColor: primaryColor,
                      minimumSize: const Size(120, 40),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: white,
                      backgroundColor: white,
                      minimumSize: const Size(120, 40),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: lightText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
