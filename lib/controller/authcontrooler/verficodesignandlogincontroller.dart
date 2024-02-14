import 'package:My_Meal_on/controller/authcontrooler/signupcontroller.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/data/datasource/remote/authdata/verifycodesinupandlogin.dart';
import 'package:get/get.dart';

abstract class VeryfiCodeSignAndLogInController extends GetxController {
  VerifycodeSinupAndLogin verifycodeSinupAndLogin =
      VerifycodeSinupAndLogin(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  checkCode();
  goToHome(String verficodesignUp);
  changeNumber();

  goToLogIn();
}

class VeryfiCodeSignAndLogInControllerImp
    extends VeryfiCodeSignAndLogInController {
  SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
  String? phonenumber;
  @override
  checkCode() {}

  @override
  goToHome(String verficodesignUp) async {
    //
    Get.offNamed(AppRoutsName.homebuttonApbar);
  }

  @override
  goToLogIn() {
    Get.offAllNamed(AppRoutsName.login);
  }

  @override
  void onInit() {
    phonenumber = Get.arguments['phonenumber'];
    super.onInit();
  }

  @override
  changeNumber() {
    Get.offNamed(AppRoutsName.signUp);
  }
}
