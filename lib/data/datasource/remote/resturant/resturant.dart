import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class ResturantData {
  MyServices myServices = Get.find();
  Crud crud;
  ResturantData(this.crud);
  getData() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud
        .getData(AppLinks.homeApi, {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  allFoodInResturantData(String restaurantId, String catId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/foods/$restaurantId",
        {"Authorization": "Bearer $token", "subcategories": catId});
    return response.fold((l) => l, (r) => r);
  }

  allFoodInSubCategoriestData(
    String restaurantId,
  ) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/filter-foods-restaurant/$restaurantId",
        {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }
}
