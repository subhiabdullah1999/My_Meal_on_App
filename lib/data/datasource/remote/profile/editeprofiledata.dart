import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class ProfileData {
  MyServices myServices = Get.find();
  Crud crud;
  ProfileData(this.crud);

  postData(
    String userName,
    String phonenumber,
    String emaile,
  ) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.postData(AppLinks.editProfile, {
      "name": userName,
      "number": phonenumber,
      "email": emaile,
    }, {
      "Authorization": "Bearer $token"
    });
    return response.fold((l) => l, (r) => r);
  }
}
