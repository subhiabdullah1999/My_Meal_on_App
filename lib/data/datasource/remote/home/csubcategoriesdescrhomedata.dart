import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class SubCategDescrData {
  MyServices myServices = Get.find();
  Crud crud;
  SubCategDescrData(this.crud);
  getData(String categoriesId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/foods-sub-categories/$categoriesId",
        {
          "Authorization": "Bearer $token",
        });
    return response.fold((l) => l, (r) => r);
  }
}
