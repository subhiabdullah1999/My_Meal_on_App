import 'package:My_Meal_on/controller/cart/cartcontroller.dart';
import 'package:My_Meal_on/controller/yororders/yororderscontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';

import 'package:My_Meal_on/view/widget/home/customcontainerimageprod.dart';
import 'package:My_Meal_on/view/widget/resturant/customIcon_desc_resturant.dart';
import 'package:My_Meal_on/view/widget/resturant/customtextsubtitleresturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOrders extends StatelessWidget {
  final String nameResturant;
  final String descr;

  final String? image;
  final String textAmount;
  final void Function()? onTap;

  const CustomListItemsOrders({
    super.key,
    required this.nameResturant,
    required this.descr,
    required this.image,
    required this.textAmount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image!,
                      ),
                      fit: BoxFit.cover),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15)),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            nameResturant.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 20,
                                    color: AppColors.blackColor3,
                                    fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              const CustomIconDescrResturant(
                                icon: Icons.star,
                                colorCircle: AppColors.oraColor,
                                colorIcon: AppColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomTextSubTileResturant(
                                subtitle: textAmount,
                              ),
                            ],
                          )
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          descr.tr,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 17,
                                  ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
