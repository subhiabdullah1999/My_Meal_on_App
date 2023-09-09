import 'package:My_Meal_on/controller/home/homecontroller.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:My_Meal_on/core/functions/translation_datbase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomResturantsContainer extends StatelessWidget {
  const CustomResturantsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.only(top: 10),
              height: 260,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        controller.goToScrenDescr(
                            controller.listHomeModel,
                            index,
                            controller.listHomeModel[index].id.toString());
                      },
                      child: Hero(
                        tag: controller.listHomeModel[index],
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(color: AppColors.whiteColor)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 120,
                                width: 270,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          controller.listResturant[index]
                                              ["image"],
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.black12,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                              ),
                              Container(
                                width: 250,
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translationData(
                                          controller.listResturant[index]
                                              ["name_ar"],
                                          controller.listResturant[index]
                                              ["name"]),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.blackColors,
                                              fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      translationData(
                                          controller.listResturant[index]
                                              ['address_ar'],
                                          controller.listResturant[index]
                                              ['address']),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.gry4,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.whiteColor4),
                                      child: Row(
                                        children: [
                                          const Image(
                                            image: AssetImage(AppImages.clok),
                                            height: 25,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "open now",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColors.green,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 17),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller.listResturant[index]
                                                    ['opening_time'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: AppColors.gry4,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 13),
                                              ),
                                              Text(
                                                " - ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: AppColors.gry4,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 13),
                                              ),
                                              Text(
                                                controller.listResturant[index]
                                                    ['closing_time'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: AppColors.gry4,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const SizedBox(
                      width: 15,
                    );
                  }),
                  itemCount: controller.listResturant.length),
            ));
  }
}
