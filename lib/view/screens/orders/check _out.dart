import 'package:My_Meal_on/controller/yororders/check_out_controller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/validinput.dart';
import 'package:My_Meal_on/view/widget/address/customcontainercurrentlocation.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customTextFormAuth.dart';
import 'package:My_Meal_on/view/widget/check_out/custom_check_out_container_del_type.dart';
import 'package:My_Meal_on/view/widget/check_out/custom_container_address.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutControllerImp controller = Get.put(CheckOutControllerImp());
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: InkWell(
                onTap: () {
                  controller.iconConfirmOrders();
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 55,
                  width: Get.width - 100,
                  decoration: BoxDecoration(
                      color: AppColors.oraColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "confirm order".tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20, color: AppColors.whiteColor),
                    ),
                  ),
                )),
            body: GetBuilder<CheckOutControllerImp>(
                builder: (controller) => HandlingDatat(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        child: ListView(
                          children: [
                            Row(children: [
                              CustomBackIcon(onPressed: () {
                                controller.goBack();
                              }),
                              const CustomTitle(
                                texttitle: "confirm order",
                              ),
                              const Spacer(),
                            ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Choose the type of delivery".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomChecOutDeliveryType(
                                      onTap: () {
                                        controller
                                            .chooseDeliveryType("delivery");
                                      },
                                      imageUrl: "assets/images/delivery.png",
                                      isActive:
                                          controller.deliveryType == "delivery"
                                              ? true
                                              : false,
                                      textTitel: "Delivery",
                                    ),
                                    CustomChecOutDeliveryType(
                                      onTap: () {
                                        controller.chooseDeliveryType(
                                            "without delivery");
                                      },
                                      imageUrl: "assets/images/take.png",
                                      isActive: controller.deliveryType ==
                                              "without delivery"
                                          ? true
                                          : false,
                                      textTitel: "without delivery",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomChecOutDeliveryType(
                                  onTap: () {
                                    controller
                                        .chooseDeliveryType("reservation");
                                  },
                                  imageUrl: "assets/images/tabel.png",
                                  isActive:
                                      controller.deliveryType == "reservation"
                                          ? true
                                          : false,
                                  textTitel: "table reservation",
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            controller.deliveryType == "delivery"
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Choose the address".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      controller.data.isEmpty
                                          ? Center(
                                              child: Column(
                                                children: [
                                                  const Card(
                                                    child: Center(
                                                      child: Text(
                                                        "No Address",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  CustomContainerCurrentAdrress(
                                                    onTap: () {
                                                      controller
                                                          .goToAddAdress();
                                                    },
                                                    textAddress:
                                                        "Enter a new address",
                                                  ),
                                                ],
                                              ),
                                            )
                                          : GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: controller.data.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                childAspectRatio: 3,
                                              ),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller.idAddress =
                                                        controller
                                                            .data[index].id
                                                            .toString();
                                                    controller.chooseAddress(
                                                        controller
                                                            .data[index].id!
                                                            .toString());
                                                  },
                                                  child: CustomContainerAddress(
                                                    isactive:
                                                        controller.addressId ==
                                                                controller
                                                                    .data[index]
                                                                    .id
                                                                    .toString()
                                                            ? true
                                                            : false,
                                                    building: controller
                                                        .data[index].building!,
                                                    city: controller
                                                        .data[index].city!,
                                                    nameaddress: controller
                                                        .data[index].address!,
                                                    number: controller
                                                        .data[index]
                                                        .contactNumber!,
                                                    strret: controller
                                                        .data[index].street!,
                                                  ),
                                                );
                                              })
                                    ],
                                  )
                                : controller.deliveryType == "reservation"
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Enter the reservation date, specifying the morning or evening"
                                                  .tr),
                                          CustomTextFormAuthWidget(
                                              mycontroller: controller.hours,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 1, 30, "phone");
                                              },
                                              hintText: "Reservation date",
                                              keyboardType:
                                                  TextInputType.multiline,
                                              suffixicon: Icons.timer),
                                        ],
                                      )
                                    : Container()
                          ],
                        ),
                      ),
                    ))));
  }
}
