import 'dart:math';

import 'package:My_Meal_on/controller/itemsdetails/itemsdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageItem extends StatelessWidget {
  final String? image;
  const CustomImageItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

    return Image.network(
      image!,
      height: Get.height / 1.8,
      width: Get.width,
      fit: BoxFit.cover,
    );
  }
}
