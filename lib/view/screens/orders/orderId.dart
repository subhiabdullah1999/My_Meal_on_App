import 'package:My_Meal_on/controller/yororders/orders_id_controller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderId extends StatelessWidget {
  const OrderId({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersIdControllerImp());
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GetBuilder<OrdersIdControllerImp>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "price".tr,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    controller.dataRes["sub total"].toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.oraColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "delivery".tr,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    controller.dataRes["delivery"].toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.oraColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              child: CustomDevider(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "price total".tr,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    controller.dataRes["order total"].toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.oraColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: ListView(
          children: [
            Row(children: [
              CustomBackIcon(onPressed: () {
                Get.back();
              }),
              const CustomTitle(
                texttitle: "your orders",
              ),
              const Spacer(),
            ]),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<OrdersIdControllerImp>(
                builder: (controller) => HandlingDatat(
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
                                return Stack(children: [
                                  Card(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 113,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .data[index].foodImage!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Text(
                                              translationData(
                                                  controller
                                                      .data[index].foodNameAr,
                                                  controller
                                                      .data[index].foodName),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColors.blackColor3,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300),
                                            ),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                  controller.data[index].price!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .oraColor,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  translationData(
                                                      controller.data[index]
                                                          .restaurantNameAr,
                                                      controller.data[index]
                                                          .restaurantName),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .blackColor3,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                ),
                                                Text(
                                                  translationData(
                                                      controller.data[index]
                                                          .restaurantAddressAr,
                                                      controller.data[index]
                                                          .restaurantAddress),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .blackColor3,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: controller
                                                .myServices.sharedPreferences
                                                .getString("lang") ==
                                            "ar"
                                        ? 10
                                        : null,
                                    right: controller
                                                .myServices.sharedPreferences
                                                .getString("lang") ==
                                            "ar"
                                        ? null
                                        : 10,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.whiteColor4,
                                      radius: 25,
                                      child: Text(
                                        controller.data[index].amount
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: AppColors.blackColor3,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ]);
                              }),
                    ))
          ],
        ),
      ),
    ));
  }
}
