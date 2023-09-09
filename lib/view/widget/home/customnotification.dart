import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomNotificationHome extends StatelessWidget {
  const CustomNotificationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.bluacc,
      ),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_active_outlined,
            size: 30,
            color: Colors.black54,
          )),
    );
  }
}
