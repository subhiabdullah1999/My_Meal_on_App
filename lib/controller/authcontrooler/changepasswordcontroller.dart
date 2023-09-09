import 'package:My_Meal_on/controller/profile/profilecontroller.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/checkinternet.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/forgetpassword/change_password.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChangePasswordController extends GetxController {
  chagePassword();
  showPassword();
  goBack();
}

class ChangePasswordControllerImp extends ChangePasswordController {
  ChangePasswrd changePasswordData = ChangePasswrd(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ProfileControllerImp controllerImp = Get.put(ProfileControllerImp());

  late TextEditingController currentPassword;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;

  MyServices myServices = Get.find();

  bool isShowwPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  showPassword() {
    isShowwPassword = isShowwPassword == false ? true : false;
    update();
  }

  @override
  chagePassword() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;

      update();
      var response = await changePasswordData.postData(
          currentPassword.text,
          password.text,
          passwordConfirmation.text,
          myServices.sharedPreferences.get("token").toString());
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("password", passwordConfirmation.text);
          update();

          Get.snackbar(
            "notification".tr,
            "Password changed successfully".tr,
            backgroundColor: AppColors.oraColor,
            colorText: AppColors.whiteColor,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
            margin: const EdgeInsets.all(5),
          );
          update();

          Get.toNamed(AppRoutsName.homebuttonApbar);
        }
      } else if ((StatusRequest.faliure == statusRequest)) {
        Get.defaultDialog(
          titlePadding: const EdgeInsets.all(10),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          title: "waring".tr,
          backgroundColor: AppColors.whiteColor,
          content: Text("The old password does not match the entered one".tr),
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
  }

  var res;
  internetData() async {
    res = await checkInterNet();
  }

  @override
  void onInit() {
    currentPassword = TextEditingController();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();

    // internetData();

    super.onInit();
  }

  @override
  goBack() {
    Get.back();
  }
}
