import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/view/widget/cart/customIcon_add_remove_item.dart';
import 'package:My_Meal_on/view/widget/home/customcontainerimageprod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsCart extends StatelessWidget {
  final String nameResturant;
  final String descr;
  final String price;
  // final String cityResturant;
  final int itemCount;

  const CustomListItemsCart(
      {super.key,
      required this.nameResturant,
      required this.descr,
      required this.price,
      // required this.cityResturant,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            // const CustomContainerImageProd(),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        nameResturant.tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 20,
                                color: AppColors.blackColor3,
                                fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        descr.tr,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 17,
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            price,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.oraColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 5),
                            child: Text(
                              ".",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: AppColors.blackColor3,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          // Text(
                          //   cityResturant.tr,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(
                          //           color: AppColors.blackColors6,
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400),
                          // ),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomIconAddAndRemoveItem(
                      onPressed: () {},
                      radius: 20,
                      iconData: Icons.add,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("$itemCount"),
                    ),
                    CustomIconAddAndRemoveItem(
                      onPressed: () {},
                      radius: 20,
                      iconData: Icons.remove,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
