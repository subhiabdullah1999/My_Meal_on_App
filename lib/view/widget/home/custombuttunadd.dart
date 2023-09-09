import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAdd extends StatelessWidget {
  final void Function() onTap;
  const CustomButtonAdd({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Padding(
      padding: EdgeInsets.only(
        left: myServices.sharedPreferences.getString("lang") == "ar" ? 0 : 30,
        right: myServices.sharedPreferences.getString("lang") == "ar" ? 30 : 0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.oraColor, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "add".tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.oraColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
