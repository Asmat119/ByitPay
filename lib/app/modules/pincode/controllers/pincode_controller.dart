import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class PincodeController extends GetxController {
// final _localAuth = LocalAuthentication();
  // var hasFingerPrintLock = false.obs;
  // var hasFaceLock = false.obs;
  // var isUserAuthenticated = false.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  //   // _getAllBiometrics();
  // }

  // // void _getAllBiometrics() async {
  // //   // To Check whether there is local authentication available on this device or not
  // //   bool hasLocalAuthentication = await _localAuth.canCheckBiometrics ||
  // //       await _localAuth.isDeviceSupported();

  // //   if (hasLocalAuthentication) {
  // //     List<BiometricType> availableBiometrics =
  // //         await _localAuth.getAvailableBiometrics();
  // //     print(availableBiometrics);
  // //     hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
  // //     // hasFingerPrintLock.value =
  // //         // availableBiometrics.contains(BiometricType.fingerprint) ||
  // //         // availableBiometrics.contains(BiometricType.strong);
  // //   } else {
  // //     showSnackBar(
  // //       title: 'Error',
  // //       message: 'Local Authentication not Available',
  // //       backgroundColor: Colors.red,
  // //     );
  // //   }
  // // }

  // void authenticateUser() async {
  //   try {
  //     // const androidMessage = AndroidAuthMessages(
  //     //     // cancelButton: 'Cancel',
  //     //     // goToSettingsButton: 'Setting',
  //     //     // goToSettingsDescription: 'Please Setup your FingerPrint/Face',
  //     //     // biometricHint: 'Verify your Identity'

  //     //     );
  //     isUserAuthenticated.value = await _localAuth.authenticate(
  //         localizedReason: 'Authenticate YourSelf',
  //         options: const AuthenticationOptions(
  //           biometricOnly: true,
  //           sensitiveTransaction: true,
  //           useErrorDialogs: true,
  //           stickyAuth: false,
  //         ),
  //         );
  //     if (isUserAuthenticated.value) {
  //       showSnackBar(
  //           title: 'Success',
  //           message: 'You Are authenticated',
  //           backgroundColor: Colors.green);
  //     }
  //   } catch (e) {
  //     showSnackBar(
  //         title: 'Error', message: e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  // void showSnackBar(
  //     {required String title,
  //     required String message,
  //     required Color backgroundColor}) {
  //   Get.snackbar(title, message,
  //       colorText: Colors.white,
  //       backgroundColor: backgroundColor,
  //       snackPosition: SnackPosition.BOTTOM);
  // }
}



class AuthService {
  static Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication localAuthentication = LocalAuthentication();
    //status of authentication.
    bool isAuthenticated = false;
    //check if device supports biometrics authentication.
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    //check if user has enabled biometrics.
    //check  
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

  //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            options: const AuthenticationOptions(
            biometricOnly: true,
            sensitiveTransaction: true,
            useErrorDialogs: true,
            stickyAuth: false,
          ),
            localizedReason: 'Scan your fingerprint to authenticate',
            // biometricOnly: true,
            // useErrorDialogs: true,
            // stickyAuth: true
            );
      } on PlatformException catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }
}
