import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChecOutDeliveryType extends StatelessWidget {
  final void Function() onTap;
  final String imageUrl;
  final String textTitel;
  final bool isActive;

  const CustomChecOutDeliveryType(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.textTitel,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: isActive == true ? AppColors.oraColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.oraColor, width: 3)),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 105,
            ),
            Text(
              textTitel.tr,
              style: TextStyle(
                  color: isActive == true
                      ? AppColors.whiteColor
                      : AppColors.blackColor3),
            ),
          ],
        ),
      ),
    );
  }
}
