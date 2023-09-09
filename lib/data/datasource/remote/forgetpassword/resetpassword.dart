import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String phonenumber, String password) async {
    var response = await crud.postData(AppLinks.resetpassword, {
      "phonenumber": phonenumber,
      "password": password,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
