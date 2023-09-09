import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class SliderOffersData {
  MyServices myServices = Get.find();

  Crud crud;
  SliderOffersData(this.crud);
  sliderOffers() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud
        .getData(AppLinks.sliderOffers, {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }
}
