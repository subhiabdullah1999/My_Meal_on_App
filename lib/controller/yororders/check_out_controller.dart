import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/address/add_address_data.dart';
import 'package:My_Meal_on/data/datasource/remote/orders/all_orders.dart';
import 'package:My_Meal_on/data/model/address/view_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

abstract class CheckOutController extends GetxController {
  goBack();
  chooseDeliveryType(String val);
  chooseAddress(String val);
  goToAddAdress();
}

class CheckOutControllerImp extends CheckOutController {
  AddAddressData addAddressData = Get.put(AddAddressData(Get.find()));
  OrdersData ordersData = Get.put(OrdersData(Get.find()));

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<ViewAddressModel> data = [];
  String? idAddress;
  late String restaurantId;
  String? deliveryType;
  String? addressId;
  String addressIdtow = '';
  String tablereservation = "no";
  String reservationtime = "";
  String withdelivery = "no";
  TextEditingController? hours;

  @override
  goBack() {
    Get.back();
  }

  @override
  goToAddAdress() {
    Get.toNamed(AppRoutsName.addAddress);
  }

  @override
  chooseAddress(val) {
    addressId = val;
    update();
  }

  @override
  chooseDeliveryType(val) {
    deliveryType = val;
    update();
  }

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addAddressData.viewddress();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List addressResponse = (response['data']['addresses']);
        data.addAll(addressResponse.map((e) => ViewAddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  iconConfirmOrders() async {
    if (deliveryType == null) {
      return Get.snackbar(
        "notification".tr,
        "Please select an order type".tr,
        animationDuration: const Duration(
          seconds: 2,
        ),
        backgroundColor: AppColors.oraColor,
        colorText: AppColors.whiteColor,
      );
    }
    if (deliveryType == "delivery") {
      withdelivery = "yes";
      if (addressId == null) {
        return Get.snackbar(
          "notification".tr,
          "Please select a delivery address".tr,
          animationDuration: const Duration(
            seconds: 2,
          ),
          backgroundColor: AppColors.oraColor,
          colorText: AppColors.whiteColor,
        );
      } else {
        addressIdtow = idAddress.toString();
      }
    }
    if (deliveryType == "reservation") {
      tablereservation = "yes";
      reservationtime = hours!.text;
      print("POPPPPPPPPPPPPPPPPPPPP");
      if (hours!.text == "") {
        return Get.snackbar(
          "notification".tr,
          "Please select a reservation date".tr,
          animationDuration: const Duration(
            seconds: 2,
          ),
          backgroundColor: AppColors.oraColor,
          colorText: AppColors.whiteColor,
        );
      }
    }

    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.confirmOrders(restaurantId,
        tablereservation, reservationtime, withdelivery, addressIdtow);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      print("ttrfggggggggggggggggggggggggggggggsssddd");
      if (response['status'] == 'success') {
        Get.bottomSheet(BottomSheet(
            backgroundColor: Colors.transparent,
            onClosing: () {},
            builder: (context) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: Get.height / 1.3,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: AppColors.goldColor2,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(30),
                            right: Radius.circular(30))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        Flexible(
                            child: Text(
                          "You Place the Order Successfully".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 20,
                                  color: AppColors.blackColor3,
                                  fontWeight: FontWeight.w400),
                        )),
                        const SizedBox(
                          height: 40,
                        ),
                        Flexible(
                            child: deliveryType == "reservation"
                                ? Text(
                                    "The table has been booked successfully. Please come on time. We thank you for your trust."
                                        .tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    "You placed the order successfully. You will get your food within 25 minutes. Thanks for using our services. Enjoy your food"
                                        .tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.center,
                                  )),
                        const SizedBox(
                          height: 85,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed(AppRoutsName.homebuttonApbar);
                          },
                          child: Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                                color: AppColors.oraColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "ok".tr,
                              style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: -50,
                      left: Get.width / 2.5,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.oraColor,
                        child: Icon(
                          Icons.done_outline,
                          color: AppColors.whiteColor,
                          size: 40,
                        ),
                      ))
                ],
              );
            }));

        // Get.rawSnackbar(

        //     title: "success".tr,
        //     messageText: Text("messagAaCart".tr),
        //     borderColor: AppColors.oraColor,
        //     borderWidth: 2,
        //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80));

        update();
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }

    // Get.snackbar(
    //   "success".tr,
    //   "Your request has been added successfully".tr,
    //   animationDuration: const Duration(
    //     seconds: 2,
    //   ),
    //   backgroundColor: AppColors.oraColor,
    //   colorText: AppColors.whiteColor,
    // );
  }

  @override
  void onInit() {
    viewAddress();
    hours = TextEditingController();
    restaurantId = Get.arguments["restaurantId"];
    print("dfssssssssssssssssssssssssssssssssssaaaaaaaaaaaaa");
    print(restaurantId);

    print("dfssssssssssssssssssssssssssssssssssaaaaaaaaaaaaa");

    super.onInit();
  }
}
