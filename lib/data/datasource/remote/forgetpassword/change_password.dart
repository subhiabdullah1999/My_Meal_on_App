import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class ChangePasswrd {
  MyServices myServices = Get.find();
  Crud crud;
  ChangePasswrd(this.crud);
  postData(String currentPassword, String password, String passwordConfirmation,
      String repassword) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.postData(AppLinks.changePassword, {
      "current_password": currentPassword,
      "password": password,
      "password_confirmation": passwordConfirmation,
    }, {
      "Authorization": "Bearer $token"
    });
    return response.fold((l) => l, (r) => r);
  }
}
