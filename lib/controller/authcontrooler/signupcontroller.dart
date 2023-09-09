import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/authdata/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SinUpController extends GetxController {
  backButton();
  signUp();
  goToLogIn();
}

class SignUpControllerImp extends SinUpController {
  SignUpData signUpData = SignUpData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController userName;
  late TextEditingController phonenumber;
  late TextEditingController password;
  late TextEditingController repassword;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  bool isShowwPassword = true;

  showPassword() {
    isShowwPassword = isShowwPassword == false ? true : false;
    update();
  }

  @override
  backButton() {
    alertDialogExitApp();
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoutsName.login);
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          userName.text, phonenumber.text, password.text, repassword.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          myServices.sharedPreferences
              .setString("token", response['data']['token'].toString());

          myServices.sharedPreferences
              .setString("id", response['data']['user']['id'].toString());
          myServices.sharedPreferences.setString(
              "username", response['data']['user']['name'].toString());
          myServices.sharedPreferences
              .setString("phone", response['data']['user']['phone'].toString());
          myServices.sharedPreferences.setString(
              "password", response['data']['user']["password"].toString());
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutsName.veryfiCodeSignAndLogIn, arguments: {
            "phonenumber": phonenumber.text,
          });
        } else {
          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            title: "waring".tr,
            backgroundColor: AppColors.whiteColor,
            content: Text("phoneAlredy".tr),
            confirm: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Get.back(canPop: false);
                  },
                  child: Text("ok".tr)),
            ),
          );
          statusRequest = StatusRequest.faliure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    phonenumber = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    phonenumber.dispose();
    password.dispose();

    super.dispose();
  }
}
