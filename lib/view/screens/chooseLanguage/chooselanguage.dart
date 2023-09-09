import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/localization/localizationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../widget/chooseLanguageWidget/customLanguageButton.dart';

class ChooseLanguage extends GetView<LocalizationController> {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "langChoose".tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomLanguageButton(
            buttText: "Ar",
            onpress: () {
              controller.changeLang("ar");
              Get.offAllNamed(AppRoutsName.onBoarding);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomLanguageButton(
            buttText: "En",
            onpress: () {
              controller.changeLang("en");
              Get.offAllNamed(AppRoutsName.onBoarding);
            },
          ),
        ],
      ),
    );
  }
}
