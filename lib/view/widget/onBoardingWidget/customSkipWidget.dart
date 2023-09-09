import 'package:My_Meal_on/controller/onBoarding_controller/controlleronBoarding.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomSkipWidget extends GetView<OnBoardingControllerImpl> {
  const CustomSkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.skipButtonController();
      },
      child: Text("skip".tr,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 25,
              color: AppColors.goldColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
