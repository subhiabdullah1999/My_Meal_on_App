import 'package:My_Meal_on/controller/cart/cartcontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:My_Meal_on/view/widget/orders/custom_list_items_orders.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/settings/customtitle.dart';

class CartTest extends StatelessWidget {
  const CartTest({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: GetBuilder<CartControllerImp>(
          builder: ((controller) => HandlingDatat(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Row(children: [
                      CustomBackIcon(onPressed: () {
                        Get.back();
                      }),
                      const CustomTitle(
                        texttitle: "cart",
                      ),
                      const Spacer(),
                    ]),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Upcoming orders".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 20,
                                          color: AppColors.blackColors7,
                                          fontWeight: FontWeight.w500),
                                )),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    controller.deletAllUpComingOrders();
                                  },
                                  child: Text(
                                    "Clear all".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18,
                                            color: AppColors.oraColor,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.data.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(30),
                                child: Center(
                                  child: Text(
                                    "no upcoming orders".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.red, fontSize: 20),
                                  ),
                                ),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 3,
                                ),
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            CustomListItemsOrders(
                                              onTap: () {
                                                controller.resturantId =
                                                    controller.data[index].id;
                                                controller.goToCartId();
                                              },
                                              textAmount: controller
                                                  .data[index].rate
                                                  .toString(),
                                              image:
                                                  controller.data[index].image,
                                              nameResturant: translationData(
                                                  controller.data[index].nameAr,
                                                  controller.data[index].name),
                                              descr: translationData(
                                                  controller
                                                      .data[index].addressAr,
                                                  controller
                                                      .data[index].address),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomDevider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "past order".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      color: AppColors.blackColors7,
                                      fontWeight: FontWeight.w500),
                            )),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                controller.deletAllPastOrders();
                              },
                              child: Text(
                                "Clear all".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 18,
                                        color: AppColors.oraColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    controller.pastResponse.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(30),
                            child: Center(
                              child: Text(
                                "no past order".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.red, fontSize: 20),
                              ),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 3,
                            ),
                            itemCount: controller.pastOrder.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        CustomListItemsOrders(
                                          onTap: () {
                                            controller.resturantIdPast =
                                                controller.pastOrder[index].id;
                                            controller.goToOrderId();
                                          },
                                          textAmount: controller
                                              .pastOrder[index].rate
                                              .toString(),
                                          image:
                                              controller.pastOrder[index].image,
                                          nameResturant: translationData(
                                              controller
                                                  .pastOrder[index].nameAr,
                                              controller.pastOrder[index].name),
                                          descr: translationData(
                                              controller
                                                  .pastOrder[index].addressAr,
                                              controller
                                                  .pastOrder[index].address),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                  ],
                ),
              ))),
    ));
  }
}
