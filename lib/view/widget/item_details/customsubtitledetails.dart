import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomSubTitleDetails extends StatelessWidget {
  final String subtitleText;
  const CustomSubTitleDetails({super.key, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Text(
      subtitleText,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.blackColors9,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ));
  }
}
