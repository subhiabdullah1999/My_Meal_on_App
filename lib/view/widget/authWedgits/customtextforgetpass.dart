import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextForgetPassword extends StatelessWidget {
  const CustomTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(
        "forget_password".tr,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(height: 1.5, color: AppColors.blackColor2, fontSize: 27),
        textAlign: TextAlign.center,
      ),
    );
  }
}
