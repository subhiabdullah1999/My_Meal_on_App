import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/address/add_address_data.dart';
import 'package:My_Meal_on/data/model/address/view_address.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class ViewAddressController extends GetxController {
  goBack();
  goToAddAdress();
  deletAddress(String addressId);
}

class ViewAddressControllerImp extends ViewAddressController {
  StatusRequest statusRequest = StatusRequest.none;
  AddAddressData addAddressData = AddAddressData(Get.find());
  MyServices myServices = Get.find();
  List<ViewAddressModel> data = [];

  @override
  goBack() {
    Get.back();
  }

  @override
  goToAddAdress() {
    Get.toNamed(AppRoutsName.addAddress);
  }

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addAddressData.viewddress();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.clear();
        List addressResponse = (response['data']['addresses']);
        data.addAll(addressResponse.map((e) => ViewAddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewAddress();

    super.onInit();
  }

  @override
  deletAddress(addressId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addAddressData.deletddress(addressId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.clear();
        viewAddress();
        update();
        Get.showSnackbar(GetSnackBar(
          titleText: Text("notification".tr),
          messageText: Text("Your address has been successfully deleted".tr),
          duration: const Duration(milliseconds: 1500),
          borderColor: AppColors.oraColor,
          backgroundColor: AppColors.whiteColor3,
          borderWidth: 2,
          margin: const EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        ));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
