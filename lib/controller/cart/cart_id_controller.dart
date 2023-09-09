import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/cart/cart_data.dart';
import 'package:My_Meal_on/data/model/carts/cart_id_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CartIdController extends GetxController {
  goBack();

  okButtomShetIcon();

  clearIcon();
  getOrderResId();

  iconConfirmOrders();
  deletItemFromCart(String itemId);
}

class CartIdControllerImp extends CartIdController {
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<CartIdModel> data = [];
  Map dataRes = {};

  int addAmount = 0;
  int descAmount = 0;

  late String resturantId;
  int? cartId;

  @override
  goBack() {
    Get.back();
  }

  @override
  okButtomShetIcon() {
    Get.back();
  }

  @override
  clearIcon() {}

  @override
  getOrderResId() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(resturantId);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response["data"]['carts'];
        dataRes = response["data"];

        data.addAll(dataresponse.map((e) => CartIdModel.fromJson(e)));
        dataresponse.clear();

        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  deletItemFromCart(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deletItemFromCart(itemId);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.clear();
        getOrderResId();

        Get.rawSnackbar(
            title: "success".tr,
            messageText: Text(
                "The product has been removed from the cart successfully".tr),
            borderColor: AppColors.oraColor,
            borderWidth: 2,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
        update();
        // Get.offNamed(AppRoutsName.carttest);
      } else {
        statusRequest = StatusRequest.faliure;
      }
      update();
    }
    update();
  }

  @override
  void onInit() async {
    resturantId = Get.arguments["resturantId"].toString();

    await getOrderResId();

    super.onInit();
  }

  @override
  iconConfirmOrders() {
    if (data.isEmpty) {
      return Get.snackbar(
        "notification".tr,
        "The cart is empty".tr,
        animationDuration: const Duration(
          seconds: 2,
        ),
        backgroundColor: AppColors.oraColor,
        colorText: AppColors.whiteColor,
      );
    } else {
      // Get.snackbar(
      //   "success".tr,
      //   "Your request has been added successfully".tr,
      //   animationDuration: const Duration(
      //     seconds: 2,
      //   ),
      //   backgroundColor: AppColors.oraColor,
      //   colorText: AppColors.whiteColor,
      // );
      Get.toNamed(AppRoutsName.checkOut, arguments: {
        "restaurantId": resturantId,
      });
    }
  }

  addAndRemoveFromCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addAndRemoveFromCart(resturantId,
        cartId.toString(), addAmount.toString(), descAmount.toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        addAmount = 0;
        descAmount = 0;
        data.clear();
        getOrderResId();
        // Get.rawSnackbar(
        //     title: "success".tr,
        //     messageText: Text(
        //         "The product has been removed from the cart successfully".tr),
        //     borderColor: AppColors.oraColor,
        //     borderWidth: 2,
        //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));
        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
      update();
    }
    update();
  }
}
