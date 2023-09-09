import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:My_Meal_on/data/model/onboardingModel.dart';
import 'package:get/get.dart';

List<OnBoadringModel> listOnBording = [
  OnBoadringModel(
      title: "title_onBoarding1".tr,
      titlethree: "title_onBoarding12".tr + "food".tr,
      titlede: "food".tr,
      discr: "disc_onBoarding1".tr,
      image: AppImages.imageOnBoardingOne),
  OnBoadringModel(
      title: "title_onBoarding2".tr,
      titlede: "food".tr,
      titlethree: "food".tr + "title_onBoarding22".tr,
      discr: "disc_onBoarding2".tr,
      image: AppImages.imageOnBoardingTow),
  OnBoadringModel(
      title: "title_onBoarding1".tr,
      titlede: "food".tr,
      titlethree: "title_onBoarding12".tr + "food".tr,
      discr: "disc_onBoarding3".tr,
      image: AppImages.imageOnBoardingThree),
  // OnBoadringModel(
  //     title: "title_onBoarding4".tr,
  //     discr: "disc_onBoarding1".tr,
  //     image: AppImages.imageOnBoardingFour),
  // OnBoadringModel(
  //     title: "title_onBoarding5".tr,
  //     discr: "disc_onBoarding1".tr,
  //     image: AppImages.imageOnBoardingTow),
];
