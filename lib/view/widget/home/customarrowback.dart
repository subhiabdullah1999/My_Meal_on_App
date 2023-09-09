import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? sharedPrifLang = myServices.sharedPreferences.getString("lang");

    return Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.bluacc,
        ),
        child: IconButton(
            onPressed: () {},
            icon: sharedPrifLang == ("en")
                ? const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 30,
                    color: Colors.black54,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 30,
                    color: Colors.black54,
                  )));
  }
}
