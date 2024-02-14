import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';
import 'package:My_Meal_on/core/functions/checkinternet.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/authdata/lodindata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LogInController extends GetxController {
  backButton();
  logIn();
  goToSignUp();
  goToForgetPassword();
}

class LogInControllerImp extends LogInController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController phonenumber;
  late TextEditingController password;
  String? fullphonenumber;
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseMessaging fcm = FirebaseMessaging.instance;
  String? firToken;

  MyServices myServices = Get.find();

  bool isShowwPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isShowwPassword = isShowwPassword == false ? true : false;
    update();
  }

  @override
  backButton() {
    alertDialogExitApp();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutsName.signUp);
  }

  @override
  logIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;

      update();
      var response =
          await loginData.postData(fullphonenumber!, password.text, firToken!);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        print("SSSSSSSSSFFFFFFFFFFFFFFFFFFFFFFggggggggggg");
        if (response['status'] == "success") {
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
          myServices.sharedPreferences
              .setString("email", response['data']['user']["email"].toString());
          myServices.sharedPreferences.setString("step", "2");

          Get.toNamed(AppRoutsName.homebuttonApbar);
        } else {
          statusRequest = StatusRequest.faliure;
          update();
          if (statusRequest == StatusRequest.faliure) {
            if (response["status"] == "faliure") {
              print("erssssssddddddddddddddddddtyyyyyyyyyyyyy");

              if (response['message'] == "Information not Correct.") {
                update();
                Get.defaultDialog(
                  titlePadding: const EdgeInsets.all(10),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  title: "waring".tr,
                  backgroundColor: AppColors.whiteColor,
                  content: Text("phone_or_pass_error".tr),
                  confirm: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back(canPop: false);
                        },
                        child: Text("ok".tr)),
                  ),
                );
                update();
              }
            }
          }
        }
      }
      update();
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutsName.forgetPassword,
        arguments: {"phonenumber": phonenumber.text});
  }

  var res;
  internetData() async {
    res = await checkInterNet();
  }

  @override
  void onInit() {
    phonenumber = TextEditingController();
    password = TextEditingController();
    fcm.getToken().then((token) {
      firToken = token!;
    });
    // internetData();

    super.onInit();
  }
}
