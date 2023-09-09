import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerProfile extends StatelessWidget {
  final String texttitle;
  final String textcontant;

  const CustomContainerProfile({
    super.key,
    required this.texttitle,
    required this.textcontant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texttitle.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColors7,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            textcontant.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor3,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomDevider(),
        ],
      ),
    );
  }
}
