import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextTitle extends StatelessWidget {
  final String textTitle;
  const CustomTextTitle({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          textTitle.tr,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.blackColor2,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ));
  }
}
