import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/view/screens/categories/categories.dart';
import 'package:My_Meal_on/view/screens/orders/your_orders.dart';
import 'package:My_Meal_on/view/screens/profile/profile.dart';
import 'package:My_Meal_on/view/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesButtAbbarController extends GetxController {
  changePages(int index);
  goToCart();
}

class CategoriesButtAbbarControllerImp extends CategoriesButtAbbarController {
  int curentpage = 0;

  List<Widget> listPages = [
    const Categories(),
    const Setting(),
    const YourOrders(),
    const Profile(),
  ];

  List titleButtomAbbar = ["Categories", "settings", "orders", "profile"];
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
}
