import 'package:My_Meal_on/controller/Resturant/resturantscreencontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';

import 'package:My_Meal_on/view/widget/categories/customtexttitle.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerabbar.dart';
import 'package:My_Meal_on/view/widget/home/customsearch.dart';
import 'package:My_Meal_on/view/widget/resturant/customgridbuilderresturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantScreen extends StatelessWidget {
  const ResturantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResturantControllerImp());
    return SafeArea(
      child: GetBuilder<ResturantControllerImp>(
          builder: ((controller) => Scaffold(
                body: ListView(
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
                      child: CustomSearchHome(
                        myController: controller.search!,
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                        search: "Search for a restaurant",
                      ),
                    ),
                    HandlingDatat(
                        statusRequest: controller.statusRequest,
                        widget: controller.isSearch == true
                            ? ListItemsSearch(
                                listSearchData: controller.listresModel)
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CustomTextTitle(
                                    textTitle: "resturants",
                                  ),
                                  CustomGridBuilderResturant(),
                                ],
                              ))
                  ],
                ),
              ))),
    );
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<HomeModel> listSearchData;
  const ListItemsSearch({
    super.key,
    required this.listSearchData,
  });

  @override
  Widget build(BuildContext context) {
    ResturantControllerImp controller = Get.put(ResturantControllerImp());

    return listSearchData.isEmpty
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
            itemCount: listSearchData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              int i = index;
              return InkWell(
                onTap: () {
                  controller.goToScrenDescr(
                      listSearchData, i, listSearchData[index].id.toString());
                },
                child: Card(
                    child: ListTile(
                  title: Text(
                    listSearchData[index].name!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.oraColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Hero(
                    tag: i,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        listSearchData[index].image!,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listSearchData[index].nameAr!,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppColors.oraColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                      ),
                      Text(
                        translationData(listSearchData[index].addressAr,
                            listSearchData[index].address),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppColors.blackColor3,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                )),
              );
            });
  }
}
