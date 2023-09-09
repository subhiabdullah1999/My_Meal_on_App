import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/data/datasource/remote/forgetpassword/checkphonenumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetController extends GetxController {
  checkNumber();

  goToLogin();
}

class ForgetControllerImp extends ForgetController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheckPhoneNumberData checkPhoneNumberData = CheckPhoneNumberData(Get.find());
  late TextEditingController phonenumber;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkNumber() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkPhoneNumberData.postData(phonenumber.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutsName.veryfiCode, arguments: {
            "phonenumber": phonenumber,
          });
        } else {
          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            title: "waring".tr,
            backgroundColor: AppColors.whiteColor,
            content: Text("phone_error".tr),
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
  goToLogin() {
    Get.offNamed(AppRoutsName.login);
  }

  @override
  void onInit() {
    phonenumber = TextEditingController();
    // phonenumber = Get.arguments['phonenumber'];
    super.onInit();
  }
}
