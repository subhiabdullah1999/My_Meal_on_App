import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImages.loading, height: 125, width: 125),
    );
  }
}
