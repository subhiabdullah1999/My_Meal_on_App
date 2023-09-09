import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/profile/editeprofiledata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  goToChanePassord();
  goBack();
  iconBackProfileScreenSettings();
  iconEditeProfile();
}

class ProfileControllerImp extends ProfileController {
  late TextEditingController userName;
  late TextEditingController phonenumber;
  late TextEditingController emaile;
  MyServices myServices = Get.find();
  ProfileData profileData = ProfileData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  goToChanePassord() {
    Get.toNamed(AppRoutsName.chanePassword);
  }

  @override
  goBack() {
    Get.offAllNamed(AppRoutsName.homebuttonApbar);
  }

  @override
  iconBackProfileScreenSettings() {
    Get.back();
  }

  @override
  iconEditeProfile() {
    Get.toNamed(AppRoutsName.editProfile);
  }

  editProfile() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.postData(
        userName.text, phonenumber.text, emaile.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        myServices.sharedPreferences
            .setString("username", response['data']['user']['name'].toString());
        myServices.sharedPreferences
            .setString("phone", response['data']['user']['phone'].toString());
        myServices.sharedPreferences
            .setString("email", response['data']['user']["email"].toString());

        Get.back();

        Get.rawSnackbar(
            title: "success".tr,
            messageText:
                Text("The information has been modified successfully".tr),
            borderColor: AppColors.oraColor,
            borderWidth: 2,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
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

  @override
  void onInit() {
    userName = TextEditingController();
    phonenumber = TextEditingController();
    emaile = TextEditingController();

    super.onInit();
  }
}
