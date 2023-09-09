import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextResetPassword extends StatelessWidget {
  const CustomTextResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(
        "re_passwprd".tr,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(height: 1.5, color: AppColors.blackColor2, fontSize: 27),
        textAlign: TextAlign.center,
      ),
    );
  }
}
