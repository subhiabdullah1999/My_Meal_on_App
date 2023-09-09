import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class VerifycodeSinupAndLogin {
  Crud crud;
  VerifycodeSinupAndLogin(this.crud);
  postData(String phonenumber, String verifyCode) async {
    var response = await crud.postData(AppLinks.verifycodesinupandogin, {
      "phone": phonenumber,
      "verifyCode": verifyCode,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
