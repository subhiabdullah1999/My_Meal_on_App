import 'dart:convert';

import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/home/categories_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/csubcategoriesdescrhomedata.dart';
import 'package:My_Meal_on/data/datasource/remote/home/home_data.dart';
import 'package:My_Meal_on/data/datasource/remote/resturant/resturant.dart';
import 'package:My_Meal_on/data/datasource/remote/slider_offers_data/slider_offers_data.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:My_Meal_on/data/model/categories/allfood_in_sub_cat_model.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:My_Meal_on/data/model/slider_offers/slider_offers_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  goBack();
  getCategoriesData();

  initData();
  goToResturantsScreen(List listResturants);
  goToCategoriesScreen(List listResturants);
  addIcon(List itemsModel, int idprud);
  onTaPCategories();
  getSubCategoriesDescr(String categoriesId);
  getSearchRestaurantData();
  goToScrenDescr(List<HomeModel> data, int selected, String restaurantId);
  gotoNotification();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late String username;
  late String phone;
  late String id;
  late String password;
  String categoriesId = "1";
  int? idprud;
  bool isLoad = false;

  TextEditingController? search;

  int selectedCategories = 0;

  bool isSearch = false;
  checkSearch(val) {
    if (val == "" || val == null) {
      isSearch = false;
      update();
    } else {
      isSearch = true;
      getSearchRestaurantData();
      listresModel.clear();
      update();
    }

    update();
  }

  CategoriesData categories = CategoriesData(Get.find());
  HomeData homeData = HomeData(Get.find());
  SliderOffersData sliderOffersData = SliderOffersData(Get.find());

  ResturantData resturantData = ResturantData(Get.find());

  SubCategDescrData subCategDescrData = SubCategDescrData(Get.find());

  List data = [];
  List listResturant = [];
  List baners = [];
  List listDataModel = [];

  List listSubCatDescModel = [];
  List listSubCatDescid = [];
  List listSearchResturant = [];
  List<HomeModel> listresModel = [];
  List<HomeModel> listHomeModel = [];
  List<SliderOffersModel> listSliderOffers = [];

  List<AllFoodInSubCategoriestModel> itemsModel = [];

  late StatusRequest statusRequest;

  @override
  getCategoriesData() async {
    statusRequest = StatusRequest.loading;
    var response = await categories.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']['subCategories']);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  getSearchRestaurantData() async {
    statusRequest = StatusRequest.loading;
    update();
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
    getCategoriesData();
    getSubCategoriesDescr(categoriesId);
    getReturantsData();
    getSliderOffers();
    // gethomeData();
    initData();
    super.onInit();
  }

  @override
  goToResturantsScreen(listResturants) {
    Get.toNamed(AppRoutsName.resturantbotomapbar, arguments: {
      "listResturants": listResturants,
    });
  }

  @override
  goBack() {
    alertDialogExitApp();
  }

  @override
  goToCategoriesScreen(List listResturants) {
    Get.toNamed(AppRoutsName.bottmapbarcategories, arguments: {
      "listResturants": listResturants,
    });
  }

  @override
  addIcon(itemsModel, idprud) {
    Get.toNamed(AppRoutsName.itemsDetails,
        arguments: {"itemsModel": itemsModel, "id": idprud});
  }

  @override
  onTaPCategories() {
    selectedCategories;
    update();
  }

  @override
  getSubCategoriesDescr(categoriesId) async {
    var response = await subCategDescrData.getData(categoriesId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsModel.clear();
        listSubCatDescModel.clear();
        listSubCatDescModel = response['data']['foods']['data'];
        itemsModel.clear();
        itemsModel.addAll(listSubCatDescModel
            .map((e) => AllFoodInSubCategoriestModel.fromJson(e)));

        isLoad = false;
      } else {
        statusRequest = StatusRequest.faliure;
      }
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
        listHomeModel.clear();

        listHomeModel.addAll(listResturant.map((e) => HomeModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
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

  getSliderOffers() async {
    var response = await sliderOffersData.sliderOffers();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        itemsModel.clear();

        List listSlider = response['data']['sliders'];
        itemsModel.clear();
        listSliderOffers
            .addAll(listSlider.map((e) => SliderOffersModel.fromJson(e)));

        isLoad = false;
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
