import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomSearchHome extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController myController;
  final String search;
  const CustomSearchHome(
      {super.key,
      this.onChanged,
      required this.myController,
      required this.search});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 30,
            color: AppColors.blackColors,
          ),
          hintText: search.tr,
          hintStyle:
              const TextStyle(color: AppColors.blackColors4, fontSize: 16),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: AppColors.whiteColor4,
        ),
      ),
    );
  }
}
