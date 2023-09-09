import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String userName, String phonenumber, String password,
      String repassword) async {
    var response = await crud.postData(AppLinks.signup, {
      "name": userName,
      "phone": phonenumber,
      "password": password,
      "password_confirmation": repassword,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
