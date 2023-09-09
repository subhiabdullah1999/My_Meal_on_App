import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomIconAddAndRemoveItem extends StatelessWidget {
  final double radius;
  final IconData iconData;
  final void Function()? onPressed;
  const CustomIconAddAndRemoveItem(
      {super.key,
      required this.radius,
      required this.iconData,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.whiteColor4,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            color: AppColors.oraColor,
          )),
    );
  }
}
