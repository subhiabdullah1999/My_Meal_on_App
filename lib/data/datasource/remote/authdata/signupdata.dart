import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String userName, String phonenumber, String password,
      String repassword, String firToken) async {
    var response = await crud.postData(AppLinks.signup, {
      "name": userName,
      "phone": phonenumber,
      "password": password,
      "password_confirmation": repassword,
      "firebase_token": firToken
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
