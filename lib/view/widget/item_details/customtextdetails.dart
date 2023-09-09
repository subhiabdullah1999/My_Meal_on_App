import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextDetails extends StatelessWidget {
  final String texttitle;
  const CustomTextDetails({super.key, required this.texttitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      texttitle.tr,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w800),
    ));
  }
}
