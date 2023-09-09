import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/orders/all_orders.dart';
import 'package:My_Meal_on/data/model/orders/past_order_model.dart';
import 'package:get/get.dart';

abstract class OrdersIdController extends GetxController {
  goBack();

  getOrderResId();
}

class OrdersIdControllerImp extends OrdersIdController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<PastOrderModel> data = [];
  Map dataRes = {};

  late String resturantId;

  @override
  goBack() {
    Get.back();
  }

  @override
  getOrderResId() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.viewPastOrders(resturantId);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print("dddddddddddddddd");
        List dataresponse = response["data"]['carts'];
        dataRes = response["data"];
        print(dataresponse);
        print("ddddddddffffffffffffffffff");

        data.addAll(dataresponse.map((e) => PastOrderModel.fromJson(e)));
        dataresponse.clear();

        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    resturantId = Get.arguments["resturantId"].toString();
    print("xxxxxxxxxxxxxxxxxxxxx");
    print(resturantId);
    print("xxxxxxxxxxxxxxxxxxxxx");

    await getOrderResId();

    super.onInit();
  }
}
