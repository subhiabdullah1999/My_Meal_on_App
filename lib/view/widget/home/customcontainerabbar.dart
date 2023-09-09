import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:My_Meal_on/view/screens/Drawer/mydrawer.dart';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomContainerAbbar extends StatelessWidget {
  final void Function()? onPressedNotif;
  final void Function()? onPressed;
  const CustomContainerAbbar(
      {super.key, required this.onPressed, required this.onPressedNotif});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.blackColor2,
          iconSize: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Delivery to".tr,
                style: const TextStyle(
                    color: AppColors.oraColor, fontWeight: FontWeight.normal),
              ),
              Text(
                "baghdad,23street".tr,
                style: const TextStyle(
                    color: AppColors.blackColor3,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onPressedNotif,
          icon: Image.asset(
            AppImages.notificationIcon,
            height: 35,
            width: 35,
            fit: BoxFit.fill,
          ),
          color: AppColors.blackColor2,
          iconSize: 50,
        )
      ],
    );
  }
}
