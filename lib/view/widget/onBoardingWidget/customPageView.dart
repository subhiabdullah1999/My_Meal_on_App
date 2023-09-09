import 'package:My_Meal_on/controller/onBoarding_controller/controlleronBoarding.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/data/datasource/static/onboardingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:highlight_text/highlight_text.dart';

class CustomPageView extends GetView<OnBoardingControllerImpl> {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    String? food = "food".tr;
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.doteController(value);
        },
        itemCount: listOnBording.length,
        itemBuilder: (context, index) => Column(
              children: [
                Image.asset(
                  listOnBording[index].image!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      listOnBording[index].title!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: "carterOne",
                          color: AppColors.blackColors,
                          fontWeight: FontWeight.normal),
                    ),
                    TextHighlight(
                      text: listOnBording[index].titlethree!,
                      words: {
                        food: HighlightedWord(
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontFamily: "carterOne",
                                  color: AppColors.goldColor,
                                  fontWeight: FontWeight.normal),
                        )
                      },
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                              fontFamily: "carterOne",
                              color: AppColors.blackColors,
                              fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: Text(
                      listOnBording[index].discr!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: "playFireDisplay",
                          color: AppColors.gry,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ))
              ],
            ));
  }
}
