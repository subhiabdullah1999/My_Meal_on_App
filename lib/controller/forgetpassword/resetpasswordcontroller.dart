import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResPasswordController extends GetxController {
  checkPassword();

  ok();

  goToForgetPassword();
}

class ResPasswordControllerImp extends ResPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  String? phonenumber;

  late TextEditingController password;
  late TextEditingController repassword;

  bool isShowwPassword = true;

  showPassword() {
    isShowwPassword = isShowwPassword == false ? true : false;
    update();
  }

  @override
  checkPassword() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await resetPasswordData.postData(phonenumber!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            title: "Done".tr,
            backgroundColor: AppColors.whiteColor,
            content: Text("donr_re_pass".tr),
          );

          // data.addAll(response['data']);
          Get.offNamed(AppRoutsName.home);
        } else {
          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            title: "waring".tr,
            backgroundColor: AppColors.whiteColor,
            content: Text("try_agin".tr),
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
  ok() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppRoutsName.homebuttonApbar);
    }
  }

  @override
  goToForgetPassword() {
    Get.offAllNamed(AppRoutsName.login);
  }

  @override
  void onInit() {
    phonenumber = Get.arguments["phonenumber"];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
