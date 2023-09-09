import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomBottomAbb extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData iconData;
  final bool active;
  const CustomBottomAbb(
      {super.key,
      this.onPressed,
      required this.text,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 32,
            color:
                active == false ? AppColors.blackColors7 : AppColors.oraColor,
          ),
          Text(
            text.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: active == false
                    ? AppColors.blackColors7
                    : AppColors.oraColor,
                fontSize: 14,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
