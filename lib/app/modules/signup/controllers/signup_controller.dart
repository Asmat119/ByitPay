import 'package:byitpay/main.dart';
import 'package:byitpay/model/personal_Info_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupController extends GetxController {
  late CameraController cameraController;


  final TextEditingController textEditingController = TextEditingController();
   Rx<TextEditingController> fNEditingController = TextEditingController().obs;
   Rx<TextEditingController> lNEditingController = TextEditingController().obs;
   Rx<TextEditingController> dOBEditingController = TextEditingController().obs;
  Rx<TextEditingController> streetEditingController = TextEditingController().obs;
  Rx<TextEditingController> aptEditingController = TextEditingController().obs;
  Rx<TextEditingController> cityEditingController = TextEditingController().obs;
  Rx<TextEditingController> taxEditingController = TextEditingController().obs;
  Rx<TextEditingController> emailEditingController = TextEditingController().obs;
  Rx<TextEditingController> passwordEditingController = TextEditingController().obs;


  String initialCountry = 'NG';
  Rx<PhoneNumber> number = PhoneNumber(isoCode: 'NG').obs;
  RxString numberText = "".obs;
  RxString lNameText = "".obs;
  RxString fNameText = "".obs;
  RxString dobText = "".obs;
  RxString streetText = "".obs;
  RxString cityText = "".obs;
  RxString aptText = "".obs;
  RxString taxText = "".obs;
  RxString emailText = "".obs;
  RxString passText = "".obs;
  RxString titleText = "Hello there!".obs;
  RxString msgText = "Lets start with some basic info. Please enter as it appears on your official ID.".obs;

  List<PersonalInfoModel> confirmLoanList = [
    PersonalInfoModel(title: "Loan Amount", subTitle: "\$30,000"),
    PersonalInfoModel(title: "Loan Terms", subTitle: "5 Months"),
    PersonalInfoModel(title: "Repayment Frequency", subTitle: "Monthly")
  ];
  final parishValue = "St.Catherine".obs;
  final countryValue = "Jamaica".obs;
  final List<String> parishItems = [
    'St.Catherine',
    'St.Catherine 2',
  ];
  final List<String> countryItems = [
    'Jamaica',
    'Jamaica 1',
  ];
  final count = 0.obs;
  final stepsCount = 1.obs;
  @override
  void onInit() {
    super.onInit();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {


    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
    this.number.value = number;
  }

  bool stepOneValid(){
    if(lNameText.isNotEmpty && fNameText.isNotEmpty && dobText.isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  bool stepTwoValid(){
    if(streetText.isNotEmpty && aptText.isNotEmpty && cityText.isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  bool stepFourValid(){
    if(taxText.isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  bool stepFiveValid(){
    if(emailText.isNotEmpty && passText.isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }


  @override
  void onClose() {
    textEditingController.dispose();
    lNEditingController.value.dispose();
    fNEditingController.value.dispose();
    taxEditingController.value.dispose();
    aptEditingController.value.dispose();
    cityEditingController.value.dispose();
    emailEditingController.value.dispose();
    passwordEditingController.value.dispose();
    streetEditingController.value.dispose();
    dOBEditingController.value.dispose();

    super.onClose();
  }

  void increment() => count.value++;
  void incrementStep() {
    stepsCount.value++;
    switch (stepsCount.value){
      case 1: {
        titleText.value = "Hello there!";
         msgText.value = "Lets start with some basic info. Please enter as it appears on your official ID.";

      }
      break;
      case 2: {
        titleText.value = "Home address";
        msgText.value = "It is required by law to verify your identity.";

      }
      break;

      case 3: {
        titleText.value = "Almost there!";
        msgText.value = "Please take a moment to ensure all of the information you provide is correct.";

      }
      break;
      case 4: {
        titleText.value = "Verify Identity";
        msgText.value = "Regulation requires us to verify your Tax Payer  Number to setup an account. ";

      }
      break;
      case 5: {
        titleText.value = "Email";
        msgText.value = "Please enter your email address and password to secure your account.";

      }
      break;


    }

  }
}
