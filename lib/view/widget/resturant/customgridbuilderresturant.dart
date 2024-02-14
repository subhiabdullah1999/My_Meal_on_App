// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:My_Meal_on/controller/Resturant/resturantscreencontroller.dart';
import 'package:My_Meal_on/controller/home/homecontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/resturant/customIcon_desc_resturant.dart';
import 'package:My_Meal_on/view/widget/resturant/customtextsubtitleresturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridBuilderResturant extends StatelessWidget {
  const CustomGridBuilderResturant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ResturantControllerImp());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GetBuilder<ResturantControllerImp>(
          builder: (controller) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listResturant.length,
              itemBuilder: ((context, index) {
                int i = index;
                return InkWell(
                  onTap: () {
                    controller.goToScrenDescr(controller.listrestuarantModel, i,
                        controller.listrestuarantModel[index].id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Hero(
                              tag: i,
                              child: Image.network(
                                controller.listResturant[index]["image"],
                                fit: BoxFit.fill,
                                height: 250,
                                width: Get.width,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  translationData(
                                      controller.listResturant[index]
                                          ['name_ar'],
                                      controller.listResturant[index]['name']),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: AppColors.blackColor3,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text("Mobile: "),
                                  CustomTextSubTileResturant(
                                    subtitle: controller.listResturant[index]
                                        ['phone'],
                                  ),
                                ],
                              )
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              CustomTextSubTileResturant(
                                subtitle: translationData(
                                    controller.listResturant[index]
                                        ['address_ar'],
                                    controller.listResturant[index]['address']),
                              ),
                              CustomTextSubTileResturant(
                                subtitle: ".       ",
                              ),
                              Row(
                                children: [
                                  CustomIconDescrResturant(
                                    icon: Icons.star,
                                    colorCircle: AppColors.oraColor,
                                    colorIcon: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomTextSubTileResturant(
                                    subtitle: controller.listResturant[index]
                                        ['rate'],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomTextSubTileResturant(
                                    subtitle: ".       ",
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomIconDescrResturant(
                                    icon: Icons.attach_money_sharp,
                                    colorCircle: Colors.transparent,
                                    colorIcon: AppColors.blackColors7,
                                  ),
                                  CustomTextSubTileResturant(
                                    subtitle: "free",
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }))),
    );
  }
}
