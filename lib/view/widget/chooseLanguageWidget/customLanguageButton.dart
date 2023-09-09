import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomLanguageButton extends StatelessWidget {
  final String buttText;
  final void Function() onpress;

  const CustomLanguageButton(
      {super.key, required this.buttText, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        height: 45,
        color: AppColors.primColor,
        onPressed: onpress,
        child: Text(
          buttText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
