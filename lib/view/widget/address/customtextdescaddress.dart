import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextDescAdrress extends StatelessWidget {
  final String textDesc;
  const CustomTextDescAdrress({super.key, required this.textDesc});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDesc.tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.blackColors7,
            fontSize: 17,
          ),
    );
  }
}
