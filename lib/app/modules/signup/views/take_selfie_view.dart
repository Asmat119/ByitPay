import 'package:byitpay/app/modules/ApplyLoanView/views/apply_loan_view_view.dart';
import 'package:byitpay/app/modules/TabView/views/HomeTab/home_tab_view.dart';
import 'package:byitpay/app/modules/login/views/login_view.dart';
import 'package:byitpay/app/modules/signup/controllers/signup_controller.dart';
import 'package:byitpay/constants/my_assets.dart';
import 'package:byitpay/constants/my_colors.dart';
import 'package:byitpay/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class TakeSelfieView extends GetView<SignupController> {
  const TakeSelfieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.initilaizeCamera();

    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        backPress: () {
          Get.back();
        },
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(27.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight - 80),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const PrimaryText(
                      title: "Take a selfie 🤳🏽",
                      subTitle:
                          "We’ll use it to verify your identity as a new user. Please take a photo for verification. "),
                  const Spacer(),
                  SvgPicture.asset(MyAssets.selfie),
                  const Spacer(),
                  PrimaryButton(
                      title: "Continue",
                      onPress: () {
                        Get.to(() => CameraScreen());
                      },
                      fontWeight: FontWeight.w600),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late int selectedCameraIndex;
  late CameraController cameraController;


  @override
  void initState()  {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initilaize();
    cameraController = CameraController(cameras[1], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      } else {}
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("Access was denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });

    // Start with back camera
  }
  void initilaize() async{
    cameras = await availableCameras();
  }
  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: double.infinity,
              child: CameraPreview(
                cameraController,
              )),

          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: white, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(
                  text: "Center your face",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 41,
                  child: const CustomText(
                    text:
                        "Align your face to the center and take a selfie for verification purpose only. ",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 91),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          cameraController.setFlashMode(FlashMode.always);
                        },
                        backgroundColor: Colors.white,
                        elevation: 0,
                        splashColor: Colors.grey,
                        child: SvgPicture.asset(MyAssets.flash),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (!cameraController.value.isInitialized) {
                            return null;
                          }
                          if (cameraController.value.isTakingPicture) {
                            return null;
                          }
                          try {
                            await cameraController.setFlashMode(FlashMode.auto);
                            XFile picture =
                                await cameraController.takePicture();
                            print(picture.path);
                            Get.back();
                          } on CameraException catch (e) {
                            debugPrint("error occur ${e.description}");
                            return null;
                          }
                        },
                        splashColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          width: 72,
                          height: 72,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 2, color: activePin)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: activePin),
                            child: Icon(
                              Icons.check_rounded,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          cameraController = CameraController(
                              cameras[0], ResolutionPreset.max);
                        },
                        backgroundColor: Colors.white,
                        elevation: 0,
                        splashColor: Colors.grey,
                        child: SvgPicture.asset(MyAssets.flip),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

          // ElevatedButton(
          //   onPressed: _takePicture,
          //   child: Text('Take Picture'),
          // ),
        ],
      ),
    );
  }
}


