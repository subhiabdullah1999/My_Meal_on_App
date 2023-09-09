import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/data/datasource/remote/forgetpassword/verifycoderesetpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VeryfiCodeController extends GetxController {
  checkCode(String verifyCOde);

  goToForgetPassword();
}

class VeryfiCodeControllerImp extends VeryfiCodeController {
  String? phonenumber;
  VerifyCodeResetPass verifyCodeResetPass = VerifyCodeResetPass(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(verifyCOde) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResetPass.postData(phonenumber!, verifyCOde);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoutsName.resetPassword,
            arguments: {"mobileNumber": phonenumber});
      } else {
        Get.defaultDialog(
          titlePadding: const EdgeInsets.all(10),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          title: "waring".tr,
          backgroundColor: AppColors.whiteColor,
          content: Text("verifycode_error".tr),
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

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutsName.forgetPassword);
  }

  @override
  void onInit() {
    phonenumber = Get.arguments['phonenumber'];

    super.onInit();
  }
}
