import 'package:My_Meal_on/controller/address/Add_Adress_Part_Tow_controller.dart';
import 'package:My_Meal_on/controller/address/add_adress_controller.dart';
import 'package:My_Meal_on/controller/address/view.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/validinput.dart';
import 'package:My_Meal_on/view/widget/address/customiconcancel.dart';
import 'package:My_Meal_on/view/widget/address/customtexttitleaddress.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customTextFormAuth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressParTow extends StatelessWidget {
  const AddAddressParTow({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdressPartTowController());
    return SafeArea(
        child: GetBuilder<AddAdressPartTowController>(
      builder: (controller) => Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: HandlingDatat(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const CustomIconCancle(),
                  const Center(
                      child:
                          CustomTextAddress(textTitle: "Enter a new address")),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuthWidget(
                    mycontroller: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 40, "username");
                    },
                    hintText: "address name",
                    keyboardType: TextInputType.streetAddress,
                    suffixicon: Icons.type_specimen,
                  ),
                  CustomTextFormAuthWidget(
                      mycontroller: controller.city,
                      valid: (val) {
                        return validInput(val!, 2, 40, "username");
                      },
                      hintText: "City name",
                      keyboardType: TextInputType.streetAddress,
                      suffixicon: Icons.home_sharp),
                  CustomTextFormAuthWidget(
                      mycontroller: controller.street,
                      valid: (val) {
                        return validInput(val!, 2, 40, "username");
                      },
                      hintText: "street name",
                      keyboardType: TextInputType.streetAddress,
                      suffixicon: Icons.edit_road),
                  CustomTextFormAuthWidget(
                      mycontroller: controller.building,
                      valid: (val) {
                        return validInput(val!, 2, 40, "username");
                      },
                      hintText: "Build name",
                      keyboardType: TextInputType.streetAddress,
                      suffixicon: Icons.home),
                  CustomTextFormAuthWidget(
                      mycontroller: controller.mobile,
                      valid: (val) {
                        return validInput(val!, 3, 30, "phone");
                      },
                      hintText: "contact number",
                      keyboardType: TextInputType.phone,
                      suffixicon: Icons.phone),
                  CustomButtonAuthWidget(
                      color: AppColors.oraColor,
                      widthleft: 20,
                      widthright: 20,
                      textButt: "add the address",
                      onPressed: () {
                        controller.addAddress();
                      }),
                ],
              ),
            )),
      ),
    ));
  }
}
