import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/cart/cart_data.dart';
import 'package:My_Meal_on/data/datasource/remote/orders/all_orders.dart';
import 'package:My_Meal_on/data/model/orders/all_orders_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  goBack();

  okButtomShetIcon();

  addCart(String itemId, String amount);
  clearIcon();
  goToCartId();
  goToOrderId();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());

  List<AllOrdersModel> data = [];
  List<AllOrdersModel> pastOrder = [];
  List pastResponse = [];

  int? resturantId;
  int? resturantIdPast;

  @override
  goBack() {
    Get.back();
  }

  @override
  okButtomShetIcon() {
    Get.back();
  }

  @override
  addCart(itemId, amount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemId, amount);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "success".tr,
            messageText: Text("messagAaCart".tr),
            borderColor: AppColors.oraColor,
            borderWidth: 2,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
        // Get.toNamed(AppRoutsName.carttest);
        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  removeCart(itemId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemId);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "success".tr,
            messageText: Text(
                "The product has been removed from the cart successfully".tr),
            borderColor: AppColors.oraColor,
            borderWidth: 2,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
        // Get.toNamed(AppRoutsName.cart);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
  }

  getAllOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.allOrders();
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataresponse = response["data"]["Upcoming Orders"]['data'];
        pastResponse = response["data"]["Past Orders"]['data'];

        data.addAll(dataresponse.map((e) => AllOrdersModel.fromJson(e)));
        pastOrder.addAll(pastResponse.map((e) => AllOrdersModel.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  deletAllUpComingOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deletAllUpComingOrder();

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

  deletAllPastOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deletAllPastOrder();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        pastOrder.clear();
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
    super.onInit();
    getAllOrders();
  }

  @override
  clearIcon() {}

  @override
  goToCartId() {
    Get.toNamed(AppRoutsName.cartId, arguments: {
      "resturantId": resturantId,
    });
  }

  @override
  goToOrderId() {
    Get.toNamed(AppRoutsName.orderId, arguments: {
      "resturantId": resturantIdPast,
    });
  }
}
