import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/data/datasource/remote/cart/cart_data.dart';
import 'package:My_Meal_on/data/datasource/remote/orders/all_orders.dart';
import 'package:My_Meal_on/data/model/carts/cart_id_model.dart';
import 'package:My_Meal_on/data/model/orders/all_orders_model.dart';
import 'package:My_Meal_on/data/model/orders/detaiels_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TrackingOrderController extends GetxController {
  goBack();
}

class TrackingOrderControllerImp extends TrackingOrderController {
  OrdersData ordersData = OrdersData(Get.find());
  CartData cartData = CartData(Get.find());

  Map<String, dynamic> data = {};
  StatusRequest statusRequest = StatusRequest.none;
  int? resturantIdPast;
  late String orderId;
  DetailseOrderModel? detailseOrderModel;

  String? statuse;

  @override
  goBack() {
    Get.back();
  }

  detailsOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.detailsOrders(orderId);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        data.clear();
        data = response['data']['order'];
        detailseOrderModel = DetailseOrderModel.fromJson(data);
        statuse = detailseOrderModel!.status;
        print("fggggggggggggggg");

        print(statuse);
        print("fggggggggggggggg");

        update();
        update();
        print("fggggggggggggggg");
        print(data);
        print("ooooooooooooooooojjjjjjjjjjjjjjj");

        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderId = Get.arguments["orderId"];
    print("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
    print(orderId);
    print("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");

    detailsOrder();

    super.onInit();
  }
}
