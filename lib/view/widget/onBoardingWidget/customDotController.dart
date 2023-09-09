import 'package:My_Meal_on/controller/onBoarding_controller/controlleronBoarding.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/data/datasource/static/onboardingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDoteController extends StatelessWidget {
  const CustomDoteController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImpl>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  listOnBording.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 900),
                    margin: const EdgeInsets.all(3),
                    height: 8,
                    width: controller.currentPage == index ? 25 : 12,
                    decoration: BoxDecoration(
                        color: controller.currentPage == index
                            ? AppColors.goldColor
                            : AppColors.gry,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ));
  }
}
