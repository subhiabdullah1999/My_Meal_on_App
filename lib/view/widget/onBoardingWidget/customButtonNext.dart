import 'package:My_Meal_on/controller/onBoarding_controller/controlleronBoarding.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNext extends GetView<OnBoardingControllerImpl> {
  const CustomButtonNext({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.nextButtController();
      },
      child: Container(
        height: 40,
        width: 240,
        decoration: BoxDecoration(
            color: AppColors.oraColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text("next".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.whiteColor, fontSize: 20)),
        ),
      ),
    );
  }
}
