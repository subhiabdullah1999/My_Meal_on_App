import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class AddAddressData {
  MyServices myServices = Get.find();
  Crud crud;
  AddAddressData(this.crud);
  addAddress(String address, String city, String street, String building,
      String contactNumber, String long, String lat) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.postData(AppLinks.addAddress, {
      "address": address,
      "city": city,
      "street": street,
      "building": building,
      "contact_number": contactNumber,
      "longitude": long,
      "latitude": lat,
    }, {
      "Authorization": "Bearer $token"
    });
    return response.fold((l) => l, (r) => r);
  }

  viewddress() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud
        .getData(AppLinks.viewAddress, {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  deletddress(String addressId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.postData(
        "https://mo.mymealon.com/public/api/delete-address/$addressId",
        {},
        {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }
}
