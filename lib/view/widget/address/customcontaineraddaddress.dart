import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerAddAddress extends StatelessWidget {
  const CustomContainerAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: TextField(
          decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        hintText: "Enter a new address".tr,
        prefixIcon: const Icon(Icons.location_pin),
      )),
    );
  }
}
