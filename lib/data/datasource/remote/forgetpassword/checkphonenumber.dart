import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';

class CheckPhoneNumberData {
  Crud crud;
  CheckPhoneNumberData(this.crud);
  postData(String phonenumber) async {
    var response = await crud.postData(AppLinks.checkponenumber, {
      "phone": phonenumber,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
