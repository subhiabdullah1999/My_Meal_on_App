import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class CategoriesData {
  MyServices myServices = Get.find();

  Crud crud;
  CategoriesData(this.crud);
  getData() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        AppLinks.subCategoriesHome, {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }
}
