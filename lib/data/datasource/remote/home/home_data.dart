import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class HomeData {
  MyServices myServices = Get.find();

  Crud crud;
  HomeData(this.crud);
  getData() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud
        .getData(AppLinks.homeApi, {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/home?keyword=$search",
        {"Authorization": "Bearer $token"});

    return response.fold((l) => l, (r) => r);
  }
}
