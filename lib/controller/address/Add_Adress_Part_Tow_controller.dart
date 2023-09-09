import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/data/datasource/remote/address/add_address_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/home_data.dart';
import 'package:My_Meal_on/data/model/address/add_adress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdressPartTowController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddAddressData addAddressData = AddAddressData(Get.find());
  TextEditingController? name;

  TextEditingController? city;

  TextEditingController? street;
  TextEditingController? building;
  TextEditingController? mobile;

  String? lat;
  String? lang;

  List<AddAdressMosel> data = [];

  goToBack() {
    Get.back();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addAddressData.addAddress(name!.text, city!.text,
        street!.text, building!.text, mobile!.text, lang!, lat!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List addressResponse = (response['data']['user']['addresses']);

        data.addAll(addressResponse.map((e) => AddAdressMosel.fromJson(e)));
        Get.showSnackbar(GetSnackBar(
          titleText: Text("notification".tr),
          messageText: Text("Your address has been added successfully".tr),
          duration: const Duration(milliseconds: 1500),
          borderColor: AppColors.oraColor,
          backgroundColor: AppColors.whiteColor3,
          borderWidth: 2,
          margin: const EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        ));
        Get.offAllNamed(AppRoutsName.homebuttonApbar);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    lat = Get.arguments["lat"];
    lang = Get.arguments["lang"];
    name = TextEditingController();

    city = TextEditingController();

    street = TextEditingController();
    building = TextEditingController();
    mobile = TextEditingController();
    super.onInit();
  }
}
