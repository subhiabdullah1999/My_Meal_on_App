import 'package:My_Meal_on/controller/categories/categoriesController.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridBuilderCategoris extends StatelessWidget {
  const CustomGridBuilderCategoris({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.put(MyServices());
    Get.put(CategoriesControllerImp());

    return GetBuilder<CategoriesControllerImp>(
        builder: ((controller) => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: ((context, index) {
              int i = index;
              return InkWell(
                onTap: () {
                  controller.goToCategoriesScreen(
                      controller.listCategoriesModelinit,
                      i,
                      controller.listCategoriesModelinit[index].id.toString());
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(children: [
                    Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.data[index]['image'],
                              ),
                            ))),
                    Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black54),
                      child: Text(
                        myServices.sharedPreferences.get("lang") == "ar"
                            ? controller.data[index]['name_ar']
                            : controller.data[index]['name'],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ]),
                ),
              );
            }))));
  }
}
