import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/categories/search_categories_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/categories_data.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  goBack();
  getCategoriesData();
  initData();

  goToCategoriesScreen(List data, int selected, String subCatId);
  gotoNotification();
  getSearchSubCategoriestData();
}

class CategoriesControllerImp extends CategoriesController {
  MyServices myServices = Get.find();
  late String username;
  late String phone;
  late String id;
  late String password;

  TextEditingController? search;
  bool isSearch = false;

  CategoriesData categories = CategoriesData(Get.find());
  SubCategoriesData subCategoriesData = SubCategoriesData(Get.find());

  List data = [];
  List listSearchCategories = [];
  List<ItemsModel> listCategoriesModelinit = [];

  List<HomeModel> listCategoriesModel = [];
  StatusRequest statusRequest = StatusRequest.none;
  @override
  getCategoriesData() async {
    statusRequest = StatusRequest.loading;
    var response = await categories.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data = (response['data']['subCategories']);

        listCategoriesModelinit.clear();
        listCategoriesModelinit.addAll(data.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "" || val == null) {
      isSearch = false;
      update();
    } else {
      isSearch = true;
      getSearchSubCategoriestData();
      listCategoriesModel.clear();

      update();
    }

    update();
  }

  @override
  initData() {
    getCategoriesData();
    search = TextEditingController();
  }

  @override
  void onInit() {
    // getData();
    initData();
    super.onInit();
  }

  @override
  goBack() {
    Get.offAllNamed(AppRoutsName.homebuttonApbar);
  }

  @override
  goToCategoriesScreen(data, selected, subCatId) {
    Get.toNamed(AppRoutsName.bottmapbarcategoriesdescr, arguments: {
      "listaData": data,
      "selected": selected,
      "subCatId": subCatId
    });
  }

  @override
  gotoNotification() {
    Get.toNamed(AppRoutsName.notification);
  }

  @override
  getSearchSubCategoriestData() async {
    statusRequest = StatusRequest.loading;
    var response = await subCategoriesData.searchData(search!.text);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listSearchCategories.clear();
        listCategoriesModel.clear();

        update();
        listSearchCategories = (response['data']['subCategories']);
        listCategoriesModel
            .addAll(listSearchCategories.map((e) => HomeModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
