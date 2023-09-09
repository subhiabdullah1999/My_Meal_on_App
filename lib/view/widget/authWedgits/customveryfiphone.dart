import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomVeryFiPhone extends StatelessWidget {
  const CustomVeryFiPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(
        "Verify Phone".tr,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(height: 1.5, color: AppColors.blackColor2, fontSize: 27),
        textAlign: TextAlign.center,
      ),
    );
  }
}
