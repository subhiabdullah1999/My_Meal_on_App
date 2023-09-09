import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/static/onboardingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  nextButtController();
  skipButtonController();

  doteController(int index);
}

class OnBoardingControllerImpl extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  doteController(int index) {
    currentPage = index;
    update();
  }

  @override
  skipButtonController() {
    Get.offAllNamed(AppRoutsName.login);
    myServices.sharedPreferences.setString("step", "1");
  }

  @override
  nextButtController() {
    currentPage++;
    if (currentPage > listOnBording.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutsName.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
