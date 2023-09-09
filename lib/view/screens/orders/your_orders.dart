import 'package:My_Meal_on/controller/yororders/yororderscontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';

import 'package:My_Meal_on/core/functions/translation_datbase.dart';

import 'package:My_Meal_on/view/widget/orders/custom_list_items_orders.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(YourOrdersImp());
    return GetBuilder<YourOrdersImp>(
        builder: ((controller) => SafeArea(
              child: Scaffold(
                body: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    children: [
                      Row(children: [
                        CustomBackIcon(onPressed: () {
                          controller.goBack();
                        }),
                        const CustomTitle(
                          texttitle: "your orders",
                        ),
                        const Spacer(),
                      ]),
                      const SizedBox(
                        height: 20,
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
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HandlingDatat(
                        statusRequest: controller.statusRequest,
                        widget: controller.data.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(100),
                                child: Center(
                                  child: Text(
                                    "no past order".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.red, fontSize: 20),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: Get.height - 100,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.data.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                CustomListItemsOrders(
                                                  onTap: () {
                                                    controller.resturantIdPast =
                                                        controller
                                                            .data[index].id;
                                                    controller.goToOrderId();
                                                  },
                                                  textAmount: controller
                                                      .data[index].rate
                                                      .toString(),
                                                  image: controller
                                                      .data[index].image,
                                                  nameResturant:
                                                      translationData(
                                                          controller.data[index]
                                                              .nameAr,
                                                          controller.data[index]
                                                              .name),
                                                  descr: translationData(
                                                      controller.data[index]
                                                          .addressAr,
                                                      controller
                                                          .data[index].address),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                      )
                    ]),
              ),
            )));
  }
}
