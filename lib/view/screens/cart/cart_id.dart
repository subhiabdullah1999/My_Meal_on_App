import 'package:My_Meal_on/controller/cart/cart_id_controller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/cart/customIcon_add_remove_item.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartId extends StatelessWidget {
  const CartId({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartIdControllerImp());
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GetBuilder<CartIdControllerImp>(
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
            CustomButtonAuthWidget(
              textButt: "confirm order",
              widthleft: 28,
              color: AppColors.oraColor,
              widthright: 28,
              onPressed: () {
                controller.iconConfirmOrders();
              },
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
                texttitle: "cart",
              ),
              const Spacer(),
            ]),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<CartIdControllerImp>(
                builder: (controller) => HandlingDatat(
                      statusRequest: controller.statusRequest,
                      widget: controller.data.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(100),
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
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  translationData(
                                                      controller.data[index]
                                                          .foodNameAr,
                                                      controller.data[index]
                                                          .foodName),
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
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                ),
                                                Row(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomIconAddAndRemoveItem(
                                                          onPressed: () {
                                                            controller
                                                                .data[index]
                                                                .amount = controller
                                                                    .data[index]
                                                                    .amount! +
                                                                1;
                                                            controller
                                                                    .addAmount =
                                                                controller
                                                                        .addAmount +
                                                                    1;
                                                            controller.cartId =
                                                                controller
                                                                    .data[index]
                                                                    .id;
                                                            controller
                                                                .addAndRemoveFromCart();
                                                          },
                                                          radius: 20,
                                                          iconData: Icons.add,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Text(
                                                            controller
                                                                .data[index]
                                                                .amount
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                color: AppColors
                                                                    .blackColor3,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        CustomIconAddAndRemoveItem(
                                                          onPressed: () {
                                                            if (controller
                                                                    .data[index]
                                                                    .amount! >
                                                                1) {
                                                              controller
                                                                  .data[index]
                                                                  .amount = controller
                                                                      .data[
                                                                          index]
                                                                      .amount! -
                                                                  1;
                                                              controller
                                                                      .descAmount =
                                                                  controller
                                                                          .descAmount +
                                                                      1;
                                                              controller
                                                                      .cartId =
                                                                  controller
                                                                      .data[
                                                                          index]
                                                                      .id;
                                                              controller
                                                                  .addAndRemoveFromCart();
                                                            } else {
                                                              Get.showSnackbar(
                                                                  GetSnackBar(
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            2),
                                                                messageText:
                                                                    Text(
                                                                  "It is not possible to request less than one"
                                                                      .tr,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ));
                                                            }
                                                          },
                                                          radius: 20,
                                                          iconData:
                                                              Icons.remove,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            trailing: Text(
                                              controller.data[index].price!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color: AppColors.oraColor,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300),
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
                                      child: IconButton(
                                        onPressed: () {
                                          controller.deletItemFromCart(
                                              controller.data[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                          Icons.delete_forever_outlined,
                                          color: AppColors.redcolor,
                                        ),
                                        iconSize: 30,
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
