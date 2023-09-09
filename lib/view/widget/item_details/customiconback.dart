import 'package:My_Meal_on/controller/itemsdetails/itemsdetailscontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return IconButton(
      onPressed: () {
        controller.goBack();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.whiteColor,
        size: 35,
      ),
    );
  }
}
