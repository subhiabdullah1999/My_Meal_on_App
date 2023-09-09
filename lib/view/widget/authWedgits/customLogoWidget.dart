import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:flutter/material.dart';

class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: Image.asset(
          AppImages.signin,
          fit: BoxFit.fill,
          width: double.infinity,
        ));
  }
}
