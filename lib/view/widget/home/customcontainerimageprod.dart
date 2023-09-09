import 'package:My_Meal_on/controller/cart/cartcontroller.dart';
import 'package:My_Meal_on/controller/yororders/yororderscontroller.dart';
import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:My_Meal_on/data/model/orders/all_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerImageProd extends StatelessWidget {
  final String? image;
  const CustomContainerImageProd({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    AllOrdersModel allOrdersModel;
    Get.put(YourOrdersImp());
    return GetBuilder<YourOrdersImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image!,
                      ),
                      fit: BoxFit.cover),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15)),
            ));
  }
}
