import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomSwichIcon extends StatelessWidget {
  final void Function(bool)? onchange;
  final bool value;

  const CustomSwichIcon({
    super.key,
    required this.onchange,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onchange,
      activeTrackColor: AppColors.oraColor,
    );
  }
}
