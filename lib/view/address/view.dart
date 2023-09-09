import 'package:My_Meal_on/controller/address/view.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/view/widget/address/customcontainercurrentlocation.dart';
import 'package:My_Meal_on/view/widget/address/customiconcancel.dart';
import 'package:My_Meal_on/view/widget/address/customtextdescaddress.dart';
import 'package:My_Meal_on/view/widget/address/customtexttitleaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressControllerImp());
    return SafeArea(
        child: GetBuilder<ViewAddressControllerImp>(
      builder: (controller) => Scaffold(
        body: ListView(
          children: [
            const CustomIconCancle(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTextAddress(textTitle: "Find restaurants near you"),
                const CustomTextDescAdrress(textDesc: "find resturant near"),
                const SizedBox(
                  height: 25,
                ),
                CustomContainerCurrentAdrress(
                  onTap: () {},
                  textAddress: "Use current location",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomContainerCurrentAdrress(
                  onTap: () {
                    controller.goToAddAdress();
                  },
                  textAddress: "Enter a new address",
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: Get.height - 350,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      border: Border(
                          bottom:
                              BorderSide(color: AppColors.oraColor, width: 3),
                          top: BorderSide(color: AppColors.oraColor, width: 3),
                          left: BorderSide(color: AppColors.oraColor, width: 3),
                          right:
                              BorderSide(color: AppColors.oraColor, width: 3))),
                  child: HandlingDatat(
                    statusRequest: controller.statusRequest,
                    widget: controller.data.isEmpty
                        ? const Card(
                            child: Center(
                              child: Text(
                                "No Address",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(children: [
                                  Card(
                                    child: ListTile(
                                      isThreeLine: true,
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: [
                                            Text(controller.data[index].city!),
                                            const Text(" - "),
                                            Text(
                                                controller.data[index].street!),
                                            const Text(" - "),
                                            Text(controller
                                                .data[index].building!),
                                          ],
                                        ),
                                      ),
                                      trailing: Text(controller
                                          .data[index].contactNumber!),
                                      title:
                                          Text(controller.data[index].address!),
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
                                      radius: 22,
                                      child: IconButton(
                                        onPressed: () {
                                          controller.deletAddress(controller
                                              .data[index].id
                                              .toString());
                                        },
                                        icon: const Icon(
                                          Icons.delete_forever_outlined,
                                          color: AppColors.redcolor,
                                        ),
                                        iconSize: 22,
                                      ),
                                    ),
                                  )
                                ]),
                              );
                            }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
