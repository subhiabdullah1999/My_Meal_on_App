import 'package:My_Meal_on/controller/cart/cartcontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomNavecationButonApparCart extends StatelessWidget {
  final String price;
  final String delivery;
  final String totalPrice;
  const CustomNavecationButonApparCart(
      {super.key,
      required this.price,
      required this.delivery,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    return Container(
      child: Column(
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
                  price,
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
                  delivery,
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
                  totalPrice,
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
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Stack(clipBehavior: Clip.none, children: [
                      Container(
                        color: Colors.transparent,
                        padding:
                            const EdgeInsets.only(top: 100, left: 5, right: 5),
                        height: Get.height / 1.5,
                        width: Get.width,
                        child: Container(
                            height: Get.height / 1.6,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: AppColors.goldColor2,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListView(children: [
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 50),
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      Text(
                                        "You Place the Order".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: AppColors.blackColor3,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Successfully".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: AppColors.blackColor3,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Text("donOrder".tr),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CustomButtonAuthWidget(
                                        color: AppColors.oraColor,
                                        textButt: "Ok".tr,
                                        onPressed: () {
                                          controller.okButtomShetIcon();
                                        },
                                        widthleft: 5,
                                        widthright: 5,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ])),
                      ),
                      Positioned(
                        height: 185,
                        left: Get.width / 2.5,
                        child: const CircleAvatar(
                          radius: 45,
                          backgroundColor: AppColors.oraColor,
                          child: Icon(
                            Icons.done,
                            color: AppColors.whiteColor,
                            size: 50,
                          ),
                        ),
                      ),
                    ]);
                  });
            },
          ),
        ],
      ),
    );
  }
}
