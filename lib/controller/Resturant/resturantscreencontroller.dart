import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/home/categories_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/home_data.dart';
import 'package:My_Meal_on/data/datasource/remote/resturant/resturant.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResturantController extends GetxController {
  goBack();
  // getData();
  initData();

  getSearchRestaurantData();
  goToScrenDescr(List data, int selected, String restaurantId);

  gotoNotification();
}

class ResturantControllerImp extends ResturantController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  ResturantData resturantData = ResturantData(Get.find());
  late String username;
  late String phone;
  late String id;
  late String password;

  CategoriesData categoriesData = CategoriesData(Get.find());

  // List data = [];
  List<HomeModel> listrestuarantModel = [];
  List listResturant = [];
  List categories = [];
  List<HomeModel> listHomeModel = [];
  List listSearchResturant = [];
  List<HomeModel> listresModel = [];

  TextEditingController? search;

  bool isSearch = false;
  checkSearch(val) {
    if (val == "" || val == null) {
      isSearch = false;
      update();
    } else {
      isSearch = true;
      getSearchRestaurantData();
      update();
    }

    update();
  }

  getReturantsData() async {
    statusRequest = StatusRequest.loading;
    var response = await resturantData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listResturant = response['data']['restaurants'];
        listrestuarantModel
            .addAll(listResturant.map((e) => HomeModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  getSearchRestaurantData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listSearchResturant.clear();
        listresModel.clear();
        update();
        listSearchResturant = (response['data']['restaurants']);
        listresModel
            .addAll(listSearchResturant.map((e) => HomeModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;

  @override
  initData() {
    username = myServices.sharedPreferences.getString("username")!;
    id = myServices.sharedPreferences.getString("id")!;
    phone = myServices.sharedPreferences.getString("phone")!;
    password = myServices.sharedPreferences.getString("password")!;
    search = TextEditingController();
  }

  @override
  void onInit() {
    getReturantsData();
    initData();
    super.onInit();
  }

  @override
  goBack() {
    Get.offAllNamed(AppRoutsName.homebuttonApbar);
  }

  @override
  goToScrenDescr(data, selected, restaurantId) {
    Get.toNamed(AppRoutsName.resturandisctbotomapbar, arguments: {
      "listaData": data,
      "selected": selected,
      "restaurantId": restaurantId
    });
  }

  @override
  gotoNotification() {
    Get.toNamed(AppRoutsName.notification);
  }
}
