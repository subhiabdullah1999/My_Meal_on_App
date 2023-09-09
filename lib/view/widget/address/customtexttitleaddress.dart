import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextAddress extends StatelessWidget {
  final String textTitle;
  const CustomTextAddress({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle.tr,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: AppColors.blackColor3),
    );
  }
}
