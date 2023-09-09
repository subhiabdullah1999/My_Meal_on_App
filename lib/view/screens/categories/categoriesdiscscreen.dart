import 'package:My_Meal_on/controller/categories/catecoriesdiscscreencontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/categories/customcategoriescontainerprod.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatecoriesDescScreen extends StatelessWidget {
  const CatecoriesDescScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesDiscControllerImp());
    return GetBuilder<CategoriesDiscControllerImp>(
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
            // child: const CustomSearchHome(),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                controller.listresturantDetailes[controller.i].image!,
                height: 180,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                height: 180,
                width: Get.width,
                child: Text(
                  translationData(
                      controller.listresturantDetailes[controller.i].nameAr!,
                      controller.listresturantDetailes[controller.i].name!),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.whiteColor, fontSize: 25),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomContainerCategoriesProd()
        ],
      ),
    );
  }
}
