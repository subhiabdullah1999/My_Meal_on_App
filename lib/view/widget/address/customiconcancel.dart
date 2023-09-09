import 'package:My_Meal_on/controller/address/view.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconCancle extends StatelessWidget {
  const CustomIconCancle({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressControllerImp controller = Get.put(ViewAddressControllerImp());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.centerLeft,
      child: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: const Icon(
            Icons.cancel,
            size: 40,
            color: AppColors.blackColor3,
          )),
    );
  }
}
