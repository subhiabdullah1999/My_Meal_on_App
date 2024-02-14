import 'dart:math';

import 'package:My_Meal_on/controller/Resturant/resturantdisccontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerabbar.dart';
import 'package:My_Meal_on/view/widget/resturant/customIcon_desc_resturant.dart';
import 'package:My_Meal_on/view/widget/resturant/customcontainersubcategories_resturant.dart';
import 'package:My_Meal_on/view/widget/resturant/customgetGategoriesResturantId.dart';
import 'package:My_Meal_on/view/widget/resturant/customtextsubtitleresturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantDescScreen extends StatelessWidget {
  const ResturantDescScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResturantDiscControllerImp());
    return GetBuilder<ResturantDiscControllerImp>(
      builder: (controller) => ListView(
        children: [
          CustomContainerAbbar(
            onPressedNotif: () {
              controller.gotoNotification();
            },
            onPressed: () {
              controller.goBack();
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
          ),
          SizedBox(
            child: Hero(
              tag: controller.i,
              child: Image.network(
                controller.listresturantDetailes[controller.i].image!,
                height: 180,
                width: Get.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 7),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextSubTileResturant(
                      subtitle: translationData(
                          controller
                              .listresturantDetailes[controller.i].addressAr,
                          controller
                              .listresturantDetailes[controller.i].address),
                    ),
                    const SizedBox(
                      width: 3,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Text("Mobile: "),
                            CustomTextSubTileResturant(
                              subtitle: controller
                                  .listresturantDetailes[controller.i].phone!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const CustomTextSubTileResturant(
                          subtitle: ".",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Open: "),
                            CustomTextSubTileResturant(
                              subtitle: controller
                                  .listresturantDetailes[controller.i]
                                  .openingTime!,
                            ),
                            const Text(" - "),
                            CustomTextSubTileResturant(
                              subtitle: controller
                                  .listresturantDetailes[controller.i]
                                  .closingTime!,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomIconDescrResturant(
                      icon: Icons.av_timer_sharp,
                      colorCircle: AppColors.oraColor,
                      colorIcon: AppColors.whiteColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const CustomTextSubTileResturant(
                      subtitle: "25 min",
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const CustomIconDescrResturant(
                      icon: Icons.attach_money_sharp,
                      colorCircle: AppColors.oraColor,
                      colorIcon: AppColors.whiteColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("delevery price".tr),
                    CustomTextSubTileResturant(
                      subtitle: controller
                          .listresturantDetailes[controller.i].deliveryPrice!,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const CustomIconDescrResturant(
                      icon: Icons.star,
                      colorCircle: AppColors.oraColor,
                      colorIcon: AppColors.whiteColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomTextSubTileResturant(
                      subtitle:
                          controller.listresturantDetailes[controller.i].rate!,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomGategoriesResturantId(),
          const SizedBox(
            height: 5,
          ),
          const CustomContainerSubCatResturant()
        ],
      ),
    );
  }
}
