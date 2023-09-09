import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class SubCategoriesData {
  MyServices myServices = Get.find();

  Crud crud;
  SubCategoriesData(this.crud);

  searchData(String search) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/sub-categories?keyword=$search",
        {"Authorization": "Bearer $token"});

    return response.fold((l) => l, (r) => r);
  }

  getFoodInSubCategoriesData(String subCatId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/foods-sub-categories/$subCatId",
        {"Authorization": "Bearer $token"});

    return response.fold((l) => l, (r) => r);
  }
}
