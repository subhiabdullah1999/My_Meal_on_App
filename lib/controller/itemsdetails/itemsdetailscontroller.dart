import 'package:My_Meal_on/controller/cart/cartcontroller.dart';
import 'package:My_Meal_on/controller/yororders/yororderscontroller.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/cart/cart_data.dart';
import 'package:My_Meal_on/data/model/categories/allfood_in_sub_cat_model.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {
  goBack();
  goToCart(List listItem, int countItem);
  intialData();
  iconAdd();
  iconRemove();
}

class ItemDetailsControllerImp extends ItemDetailsController {
  // CartControllerImp cartController = Get.put(CartControllerImp());
  YourOrdersImp ordersController = Get.put(YourOrdersImp());
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  int i = 1;
  List data = [];
  late int idprud;
  late List<AllFoodInSubCategoriestModel> itemsModel;

  @override
  goBack() {
    Get.back();
  }

  @override
  goToCart(listItem, countItem) {
    Get.toNamed(
      AppRoutsName.carttest,
    );
  }

  @override
  intialData() {
    // data = Get.arguments['listData'];
  }

  @override
  void onInit() {
    idprud = Get.arguments['id'];
    itemsModel = Get.arguments['itemsModel'];
    super.onInit();
  }

  @override
  iconAdd() {
    if (i >= 1) {
      i = i + 1;
    }
    update();
  }

  @override
  iconRemove() {
    if (i > 1) {
      i = i - 1;
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 2),
        messageText: Text(
          "It is not possible to request less than one".tr,
          textAlign: TextAlign.center,
        ),
      ));
    }

    update();
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
        Get.toNamed(AppRoutsName.carttest);
        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
