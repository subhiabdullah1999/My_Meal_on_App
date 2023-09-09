// ignore_for_file: sort_child_properties_last

import 'package:My_Meal_on/controller/Resturant/resturantbutomapbarcontroller.dart';
import 'package:My_Meal_on/controller/Resturant/resturantscreencontroller.dart';
import 'package:My_Meal_on/controller/categories/custombotnapbarController.dart';
import 'package:My_Meal_on/controller/home/homebuttAbbarcontroler.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';

import 'package:My_Meal_on/view/widget/home/custombutomabb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomResturantBotomApbar extends StatelessWidget {
  const CustomResturantBotomApbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ResturantButtAbbarControllerImp());
    return GetBuilder<ResturantButtAbbarControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.oraColor,
          onPressed: () {
            Get.toNamed(AppRoutsName.carttest);
          },
          child: const Icon(Icons.shopping_cart),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.listPages.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomBottomAbb(
                        onPressed: () {
                          controller.changePages(i);
                        },
                        text: controller.titleButtomAbbar[i],
                        iconData: controller.listIconData[i],
                        active: controller.curentpage == i ? true : false);
              })
            ],
          ),
        ),
        body: controller.listPages.elementAt(controller.curentpage),
      ),
    );
  }
}
