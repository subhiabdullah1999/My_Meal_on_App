import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/orders/all_orders.dart';
import 'package:My_Meal_on/data/model/orders/order_deta_model.dart';
import 'package:My_Meal_on/data/model/orders/past_order_model.dart';
import 'package:get/get.dart';

abstract class OrdersIdController extends GetxController {
  goBack();

  getOrderResId();
  goToTrackingOrder();
}

class OrdersIdControllerImp extends OrdersIdController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<PastOrderModel> data = [];
  List dataresponse = [];
  List dataresponseorder = [];
  List<OrderDetaModel> listOrderDeta = [];

  Map dataRes = {};
  String? orderId;

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
        dataresponse.clear();

        dataresponse = response["data"]['carts'];

        dataRes = response["data"];
        print(dataresponse);

        data.addAll(dataresponse.map((e) => PastOrderModel.fromJson(e)));
        listOrderDeta
            .addAll(dataresponse.map((e) => OrderDetaModel.fromJson(e)));

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

  @override
  goToTrackingOrder() {
    Get.toNamed(
      AppRoutsName.trackingOrder,
      arguments: {"orderId": orderId},
    );
  }
}
