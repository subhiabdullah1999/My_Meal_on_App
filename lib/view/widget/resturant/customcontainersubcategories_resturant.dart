import 'dart:math';

import 'package:My_Meal_on/controller/Resturant/resturantdisccontroller.dart';

import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';

import 'package:My_Meal_on/view/widget/home/customdescprod.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constans/appColors.dart';

class CustomContainerSubCatResturant extends StatelessWidget {
  const CustomContainerSubCatResturant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ResturantDiscControllerImp());

    return Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: GetBuilder<ResturantDiscControllerImp>(
          builder: (controller) => controller.listFoodSub.isEmpty
              ? Card(
                  child: Container(
                  height: 100,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ))
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.2,
                  ),
                  itemBuilder: ((context, index) {
                    int i = index;
                    controller.subCatId = controller
                        .listresturantDetailes[controller.i]
                        .subCategories![0]
                        .id
                        .toString();
                    return HandlingDatat(
                        statusRequest: controller.statusRequest,
                        widget: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Hero(
                                  tag: controller.listFoodSub[index],
                                  child: Container(
                                      height: 115,
                                      width: 115,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            controller
                                                .listFoodSub[index].image!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                    title: Text(
                                      translationData(
                                          controller.listFoodSub[index].nameAr,
                                          controller.listFoodSub[index].name),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.blackColor3,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                    ),
                                    subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  translationData(
                                                      controller
                                                          .listFoodSub[index]
                                                          .restaurantNameAr,
                                                      controller
                                                          .listFoodSub[index]
                                                          .restaurant),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .blackColor3,
                                                          fontSize: 16),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    translationData(
                                                        controller
                                                            .listFoodSub[index]
                                                            .descriptionAr,
                                                        controller
                                                            .listFoodSub[index]
                                                            .description),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackColor3,
                                                            fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                CustomDescProd(
                                                  onTap: () {
                                                    controller.addIcon(
                                                        controller.listFoodSub,
                                                        i);
                                                  },
                                                  price: controller
                                                      .listFoodSub[index]
                                                      .price!,
                                                  time: "25 min",
                                                )
                                              ],
                                            ),
                                          )
                                        ])),
                              )
                            ],
                          ),
                        ));
                  }),
                  itemCount: controller.listFoodSub.length),
        ));
  }
}
