import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class VerifyCodeResetPass {
  Crud crud;
  VerifyCodeResetPass(this.crud);
  postData(String mobileNumber, String verifycode) async {
    var response = await crud.postData(AppLinks.verfycoderesetpass, {
      "phone": mobileNumber,
      "verifycode": verifycode,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
