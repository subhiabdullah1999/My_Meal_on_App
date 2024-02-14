import 'package:My_Meal_on/core/class/crud.dart';
import 'package:My_Meal_on/core/constans/applinks.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

class OrdersData {
  MyServices myServices = Get.find();

  Crud crud;
  OrdersData(this.crud);
  allOrders() async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud
        .getData(AppLinks.allOrders, {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  viewPastOrders(
    String resturantId,
  ) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
        "https://mo.mymealon.com/public/api/my-past-cart/$resturantId",
        {"Authorization": "Bearer $token"});
    return response.fold((l) => l, (r) => r);
  }

  confirmOrders(String resturantId, String tablereservation,
      String reservationtime, String withdelivery, String userAddressId) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud
        .postData("https://mo.mymealon.com/public/api/order/$resturantId", {
      "table_reservation": tablereservation,
      "reservation_time": reservationtime,
      "with_delivery": withdelivery,
      "user_addresses_id": userAddressId
    }, {
      "Authorization": "Bearer $token"
    });
    return response.fold((l) => l, (r) => r);
  }

  detailsOrders(
    String orderId,
  ) async {
    var token = myServices.sharedPreferences.get("token").toString();
    var response = await crud.getData(
      "https://mo.mymealon.com/public/api/order-user-details/$orderId",
      {"Authorization": "Bearer $token"},
    );
    return response.fold((l) => l, (r) => r);
  }
}
