import 'package:My_Meal_on/controller/home/homecontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:My_Meal_on/view/widget/home/custombuttunadd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDescProd extends StatelessWidget {
  final String price;
  final String time;
  final void Function() onTap;

  const CustomDescProd(
      {super.key,
      required this.price,
      required this.time,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.oraColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: Text(
                      ".",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.blackColor3,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.blackColors6,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  CustomButtonAdd(
                    onTap: onTap,
                  )
                ],
              ),
            ));
  }
}
