import 'package:My_Meal_on/controller/home/homecontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGategoriesContainer extends StatelessWidget {
  const CustomGategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.put(MyServices());

    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              margin:
                  const EdgeInsets.only(left: 5, right: 5, top: 4, bottom: 7),
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      minWidth: 30,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: controller.selectedCategories == index
                          ? AppColors.oraColor
                          : AppColors.whiteColor,
                      onPressed: () {
                        controller.onTaPCategories();
                        controller.selectedCategories = index;
                        controller.getSubCategoriesDescr(
                            controller.data[index]['id'].toString());

                        controller.isLoad = true;
                      },
                      child: controller.selectedCategories == index &&
                              controller.isLoad == true
                          ? const CircularProgressIndicator()
                          : Text(
                              translationData(
                                controller.data[index]['name_ar'],
                                controller.data[index]['name'],
                              ),
                              style: TextStyle(
                                  fontSize:
                                      controller.selectedCategories == index
                                          ? 27
                                          : 16),
                            ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemCount: controller.data.length),
            ));
  }
}
