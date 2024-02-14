import 'package:My_Meal_on/controller/yororders/tracking_order_controller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/data/model/orders/detaiels_order_model.dart';
import 'package:My_Meal_on/view/widget/orders/custom_done_tracking.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trackingorder extends StatelessWidget {
  const Trackingorder({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingOrderControllerImp controller =
        Get.put(TrackingOrderControllerImp());
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: ListView(children: [
                  Row(children: [
                    CustomBackIcon(onPressed: () {
                      controller.goBack();
                    }),
                    const CustomTitle(
                      texttitle: "order tracking",
                    ),
                    const Spacer(),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  TrackOrder(
                    detailseOrderModel:
                        DetailseOrderModel.fromJson(controller.data),
                  )
                ]))));
  }
}

class TrackOrder extends StatelessWidget {
  final DetailseOrderModel detailseOrderModel;
  const TrackOrder({
    super.key,
    required this.detailseOrderModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GetBuilder<TrackingOrderControllerImp>(
          builder: (controller) => controller.statuse == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          controller.statuse == "pending" ||
                                  controller.statuse == "pickedup" ||
                                  controller.statuse == "delivered"
                              ? const DoneTracking(
                                  colorCircel: Colors.green,
                                  colorIconDone: AppColors.whiteColor,
                                )
                              : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 75,
                            width: Get.width - 100,
                            decoration: BoxDecoration(
                                color: controller.statuse == "pending" ||
                                        controller.statuse == "pickedup" ||
                                        controller.statuse == "delivered"
                                    ? AppColors.oraColor
                                    : AppColors.whiteColor4,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "The meal is being prepared".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: controller.statuse == "pending"
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor3,
                                        fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          controller.statuse == "pickedup" ||
                                  controller.statuse == "delivered"
                              ? const DoneTracking(
                                  colorCircel: Colors.green,
                                  colorIconDone: AppColors.whiteColor,
                                )
                              : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 75,
                            width: Get.width - 100,
                            decoration: BoxDecoration(
                                color: controller.statuse == "pickedup" ||
                                        controller.statuse == "delivered"
                                    ? AppColors.oraColor
                                    : AppColors.whiteColor4,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "order has been prepared".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: controller.statuse == "pickedup"
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor3,
                                        fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          controller.statuse == "pickedup" ||
                                  controller.statuse == "delivered"
                              ? const DoneTracking(
                                  colorCircel: Colors.green,
                                  colorIconDone: AppColors.whiteColor,
                                )
                              : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 75,
                            width: Get.width - 100,
                            decoration: BoxDecoration(
                                color: controller.statuse == "pickedup" ||
                                        controller.statuse == "delivered"
                                    ? AppColors.oraColor
                                    : AppColors.whiteColor4,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "order is on the way".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: controller.statuse == "pickedup"
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor3,
                                        fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          controller.statuse == "delivered"
                              ? const DoneTracking(
                                  colorCircel: Colors.green,
                                  colorIconDone: AppColors.whiteColor,
                                )
                              : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 75,
                            width: Get.width - 100,
                            decoration: BoxDecoration(
                                color: controller.statuse == "delivered"
                                    ? AppColors.oraColor
                                    : AppColors.whiteColor4,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "order has been delivered".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: controller.statuse == "delivered"
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor3,
                                        fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ));
  }
}
