import 'package:My_Meal_on/controller/notifications/notifications.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return SafeArea(
        child: GetBuilder<NotificationControllerImp>(
      builder: (controller) => Scaffold(
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            children: [
              Row(children: [
                CustomBackIcon(onPressed: () {
                  controller.goBack();
                }),
                const CustomTitle(
                  texttitle: "notifications",
                )
              ]),
              Container(
                padding: EdgeInsets.symmetric(vertical: Get.height / 2.4),
                alignment: Alignment.center,
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Notification".tr,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
              ),
            ]),
      ),
    ));
  }
}
