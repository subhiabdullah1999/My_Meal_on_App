import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextResturant extends StatelessWidget {
  final String text1;
  final String? text2;

  final Function()? onTap;
  const CustomTextResturant(
      {super.key, required this.text1, required this.onTap, this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text1.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.blackColor2,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          )),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  "see all".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.oraColor),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: AppColors.oraColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
