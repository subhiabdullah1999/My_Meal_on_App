import 'dart:math';

import 'package:My_Meal_on/controller/itemsdetails/itemsdetailscontroller.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/cart/customIcon_add_remove_item.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:My_Meal_on/view/widget/item_details/customiconback.dart';
import 'package:My_Meal_on/view/widget/item_details/customimageitem.dart';
import 'package:My_Meal_on/view/widget/item_details/customsubtitledetails.dart';
import 'package:My_Meal_on/view/widget/item_details/customtextdetails.dart';
import 'package:My_Meal_on/view/widget/resturant/customIcon_desc_resturant.dart';
import 'package:My_Meal_on/view/widget/resturant/customtextsubtitleresturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());

    return GetBuilder<ItemDetailsControllerImp>(
        builder: (controller) => SafeArea(
              child: Scaffold(
                body: Stack(children: [
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height / 1.8,
                      child: Stack(children: [
                        CustomImageItem(
                          image: controller.itemsModel[controller.idprud].image,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Row(
                            children: const [
                              CustomIconBack(),
                              SizedBox(
                                width: 110,
                              ),
                              CustomTextDetails(
                                texttitle: "details",
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: Get.width,
                      height: Get.height / 2,
                      decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(75))),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    translationData(
                                        controller.itemsModel[controller.idprud]
                                            .nameAr,
                                        controller.itemsModel[controller.idprud]
                                            .name),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppColors.blackColor3,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      CustomIconDescrResturant(
                                        icon: Icons.star,
                                        colorCircle: AppColors.oraColor,
                                        colorIcon: AppColors.whiteColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomTextSubTileResturant(
                                        subtitle: "4.5",
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            subtitle: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomSubTitleDetails(
                                      subtitleText: translationData(
                                          controller
                                              .itemsModel[controller.idprud]
                                              .descriptionAr,
                                          controller
                                              .itemsModel[controller.idprud]
                                              .description)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconAddAndRemoveItem(
                                onPressed: () {
                                  controller.iconAdd();
                                },
                                radius: 35,
                                iconData: Icons.add,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  controller.i.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: AppColors.blackColor3,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              CustomIconAddAndRemoveItem(
                                onPressed: () {
                                  controller.iconRemove();
                                },
                                radius: 35,
                                iconData: Icons.remove,
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: CustomDevider()),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "price".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    controller
                                        .itemsModel[controller.idprud].price!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.oraColor),
                                  ),
                                ],
                              ),
                              GetBuilder<ItemDetailsControllerImp>(
                                builder: (controller) => controller
                                            .statusRequest ==
                                        StatusRequest.loading
                                    ? const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    : CustomButtonAuthWidget(
                                        textButt: "Add to Cart",
                                        widthleft: 50,
                                        color: AppColors.oraColor,
                                        widthright: 50,
                                        onPressed: () {
                                          controller.addCart(
                                              controller
                                                  .itemsModel[controller.idprud]
                                                  .id
                                                  .toString(),
                                              controller.i.toString());
                                        },
                                      ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }
}
