import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackIcon extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBackIcon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor3,
              size: 30,
            )),
      ),
    );
  }
}
