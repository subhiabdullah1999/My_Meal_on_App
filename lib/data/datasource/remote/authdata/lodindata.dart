import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String phonenumber, String password, String firToken) async {
    var response = await crud.postData(AppLinks.login, {
      "phone": phonenumber,
      "password": password,
      "firebase_token": firToken
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
