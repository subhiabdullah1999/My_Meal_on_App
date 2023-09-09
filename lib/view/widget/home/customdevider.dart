import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.blackColors5,
      height: 3,
      endIndent: 3,
      indent: 3,
      thickness: 1,
    );
  }
}
