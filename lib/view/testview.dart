import 'package:My_Meal_on/controller/testcontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestViewData extends StatelessWidget {
  const TestViewData({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
        centerTitle: true,
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDatat(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
