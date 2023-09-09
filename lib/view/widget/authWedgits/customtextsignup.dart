import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextSignUpOrLogin extends StatelessWidget {
  final String textone;
  final String textTow;
  final void Function()? onTap;

  const CustomTextSignUpOrLogin(
      {super.key, required this.textone, required this.textTow, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textone.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: AppColors.gry3),
          ),
          InkWell(
              onTap: onTap,
              child: Text(
                textTow.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.oraColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
