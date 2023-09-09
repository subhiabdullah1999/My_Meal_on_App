import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerCurrentAdrress extends StatelessWidget {
  final void Function()? onTap;
  final String textAddress;
  const CustomContainerCurrentAdrress(
      {super.key, required this.textAddress, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        width: Get.width - 50,
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.oraColor),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage(AppImages.locationicon),
              color: AppColors.oraColor,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              textAddress.tr,
              // "Use current location".tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.oraColor,
                    fontSize: 17,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
