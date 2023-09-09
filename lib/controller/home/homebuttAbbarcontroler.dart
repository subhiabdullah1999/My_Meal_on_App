import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/view/screens/home/home.dart';
import 'package:My_Meal_on/view/screens/orders/your_orders.dart';
import 'package:My_Meal_on/view/screens/profile/profile.dart';
import 'package:My_Meal_on/view/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeButtAbbarController extends GetxController {
  changePages(int index);
  goToCart();
  gotoNotification();
}

class HomeButtAbbarControllerImp extends HomeButtAbbarController {
  int curentpage = 0;

  List<Widget> listPages = [
    const Home(),
    const Setting(),
    const YourOrders(),
    const Profile(),
  ];

  List titleButtomAbbar = ["home", "settings", "orders", "profile"];
  List<IconData> listIconData = [
    Icons.restaurant,
    Icons.settings,
    Icons.restaurant_menu,
    Icons.person
  ];

  @override
  changePages(int index) {
    curentpage = index;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutsName.cart);
  }

  @override
  gotoNotification() {
    Get.toNamed(AppRoutsName.notification);
  }
}
