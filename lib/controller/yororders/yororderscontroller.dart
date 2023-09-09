import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/data/datasource/remote/cart/cart_data.dart';
import 'package:My_Meal_on/data/datasource/remote/orders/all_orders.dart';
import 'package:My_Meal_on/data/model/carts/cart_id_model.dart';
import 'package:My_Meal_on/data/model/orders/all_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class YourOrders extends GetxController {
  goBack();
  getAllOrders();
  initialData();
  clearIcon();
  goToOrderId();
}

class YourOrdersImp extends YourOrders {
  OrdersData ordersData = OrdersData(Get.find());
  CartData cartData = CartData(Get.find());

  List<AllOrdersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  int? resturantIdPast;

  @override
  goBack() {
    Get.offAllNamed(AppRoutsName.homebuttonApbar);
  }

  @override
  getAllOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.allOrders();
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataresponse = response["data"]["Past Orders"]['data'];

        print(dataresponse.toString());

        data.addAll(dataresponse.map((e) => AllOrdersModel.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  deletAllPastOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deletAllPastOrder();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.clear();
        update();
        Get.rawSnackbar(
            title: "success".tr,
            messageText: Text(
                "The product has been removed from the cart successfully".tr),
            borderColor: AppColors.oraColor,
            borderWidth: 2,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
      } else {
        statusRequest = StatusRequest.faliure;
        Get.rawSnackbar(
            title: "success".tr,
            messageText: Text("hhhhhhhhhhhhhhhhhhhhh".tr),
            borderColor: AppColors.oraColor,
            borderWidth: 2,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    getAllOrders();
  }

  @override
  clearIcon() {
    data.clear();
    update();
  }

  @override
  goToOrderId() {
    Get.toNamed(AppRoutsName.orderId, arguments: {
      "resturantId": resturantIdPast,
    });
  }
}
