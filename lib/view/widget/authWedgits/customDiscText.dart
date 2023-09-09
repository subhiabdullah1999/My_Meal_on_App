import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomDiscTextWidget extends StatelessWidget {
  final String? discText;
  const CustomDiscTextWidget({super.key, this.discText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(
        discText!.tr,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            height: 1.5,
            color: AppColors.blackColor2,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
