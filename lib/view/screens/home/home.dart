import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:My_Meal_on/view/widget/home/customTextResturant.dart';
import 'package:My_Meal_on/view/widget/home/custombanner.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerabbar.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerprod.dart';
import 'package:My_Meal_on/view/widget/home/customgategoriescontainer.dart';
import 'package:My_Meal_on/view/widget/home/customresturantcontainer.dart';
import 'package:My_Meal_on/view/widget/home/customsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/homecontroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 1),
          color: AppColors.whiteColor2,
          child: ListView(
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
                          listSearchData: controller.listresModel,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextResturant(
                              text1: "resturants",
                              onTap: () {
                                controller
                                    .goToResturantsScreen(controller.data);
                              },
                            ),
                            const CustomResturantsContainer(),
                            const CustomBannerContainer(),
                            CustomTextResturant(
                              text1: "top categories",
                              onTap: () {
                                controller
                                    .goToCategoriesScreen(controller.data);
                              },
                            ),
                            const CustomGategoriesContainer(),
                            const CustomContainerProd()
                          ],
                        ))
            ],
          )),
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
    HomeControllerImp controller = Get.put(HomeControllerImp());

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
              return InkWell(
                onTap: () {
                  int i = index;
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
                    tag: index,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(listSearchData[index].image!),
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
