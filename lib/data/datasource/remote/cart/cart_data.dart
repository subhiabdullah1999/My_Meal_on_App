import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class CartData {
  MyServices myServices = Get.find();

  Crud crud;
  CartData(this.crud);
  addCart(String usersId, String itemId, String amount) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.postData(
        "https://mo.mymealon.com/public/api/add-to-cart/$itemId",
        {"amount": amount},
        {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersId, String itemId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.deletData(
      "https://mo.mymealon.com/public/api/delete-cart-item/$itemId",
      {},
      {"Authorization": "Bearer $token"},
    );
    return response.fold((l) => l, (r) => r);
  }

  viewCart(
    String resturantId,
  ) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/my-cart/$resturantId",
        {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  deletAllUpComingOrder() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.deletData(
      AppLinks.deletAllUpComingOrders,
      {},
      {"Authorization": "Bearer $token"},
    );
    return response.fold((l) => l, (r) => r);
  }

  deletAllPastOrder() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.deletData(
      AppLinks.deletAllUpPastOrders,
      {},
      {"Authorization": "Bearer $token"},
    );
    return response.fold((l) => l, (r) => r);
  }

  deletItemFromCart(String itemId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.deletData(
      "https://mo.mymealon.com/public/api/delete-cart-item/$itemId",
      {},
      {"Authorization": "Bearer $token"},
    );
    return response.fold((l) => l, (r) => r);
  }

  addAndRemoveFromCart(String resturantId, String cartId, String addamount,
      String decreaseamount) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.postData(
        "https://mo.mymealon.com/public/api/add-amount/$resturantId/$cartId",
        {"add_amount": addamount, "decrease_amount": decreaseamount},
        {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }
}
