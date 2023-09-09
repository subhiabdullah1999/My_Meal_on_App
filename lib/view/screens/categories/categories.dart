import 'package:My_Meal_on/controller/categories/categoriesController.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:My_Meal_on/view/widget/categories/CustoGridBuilderCategories.dart';
import 'package:My_Meal_on/view/widget/categories/customtexttitle.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerabbar.dart';
import 'package:My_Meal_on/view/widget/home/customsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerImp());
    return SafeArea(
      child: GetBuilder<CategoriesControllerImp>(
          builder: (controller) => Container(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 1),
              color: AppColors.whiteColor2,
              child: ListView(children: [
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
                  child: CustomSearchHome(
                    myController: controller.search!,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    search: "Search for a item",
                  ),
                ),
                HandlingDatat(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearch == true
                        ? ListItemsSearch(
                            dataSearchCategories:
                                controller.listCategoriesModelinit,
                          )
                        : Column(
                            children: const [
                              CustomTextTitle(
                                textTitle: "Categories",
                              ),
                              CustomGridBuilderCategoris(),
                            ],
                          ))
              ]))),
    );
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<ItemsModel> dataSearchCategories;
  const ListItemsSearch({
    super.key,
    required this.dataSearchCategories,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());

    return dataSearchCategories.isEmpty
        ? Center(
            child: Text(
              "No Data".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.redcolor),
            ),
          )
        : ListView.builder(
            itemCount: dataSearchCategories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              int i = index;
              return InkWell(
                onTap: () {
                  controller.goToCategoriesScreen(dataSearchCategories, i,
                      dataSearchCategories[index].id.toString());
                },
                child: Card(
                    child: ListTile(
                  title: Text(
                    dataSearchCategories[index].name!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.oraColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Hero(
                    tag: i,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(dataSearchCategories[index].image!),
                    ),
                  ),
                  subtitle: Text(
                    dataSearchCategories[index].nameAr!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.oraColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  isThreeLine: true,
                )),
              );
            });
  }
}
