import 'package:My_Meal_on/controller/onBoarding_controller/controlleronBoarding.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';

import 'package:My_Meal_on/view/widget/onBoardingWidget/customButtonNext.dart';
import 'package:My_Meal_on/view/widget/onBoardingWidget/customDotController.dart';
import 'package:My_Meal_on/view/widget/onBoardingWidget/customPageView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../widget/onBoardingWidget/customSkipWidget.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(flex: 3, child: CustomPageView()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const CustomDoteController(),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: const [
                            CustomButtonNext(),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomSkipWidget())
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
