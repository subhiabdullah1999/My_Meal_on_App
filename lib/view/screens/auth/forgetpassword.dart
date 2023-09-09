import 'package:My_Meal_on/controller/forgetpassword/forgetcontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/class/loading.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/validinput.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customDiscText.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customLogoWidget.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customTextFormAuth.dart';

import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customtextforgetpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/authWedgits/customveryfiphone.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetControllerImp controller = Get.put(ForgetControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              controller.goToLogin();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.blackColors,
              size: 30,
            )),
      ),
      body: GetBuilder<ForgetControllerImp>(
          builder: (controller) => HandlingDatatRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const CustomTextForgetPassword(),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomDiscTextWidget(discText: "ent_mobile_number"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormAuthWidget(
                          valid: (valeu) {
                            return validInput(valeu!, 3, 30, "phone");
                          },
                          mycontroller: controller.phonenumber,
                          keyboardType: TextInputType.phone,
                          hintText: "mobile_number",
                          iconData: Icons.mobile_friendly_outlined),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomButtonAuthWidget(
                          color: AppColors.oraColor,
                          widthleft: 1,
                          widthright: 1,
                          textButt: "ok",
                          onPressed: () {
                            Get.offNamed(AppRoutsName.veryfiCode, arguments: {
                              "phoneNumber": controller.phonenumber
                            });
                          }),
                    ],
                  ),
                ),
              ))),
    ));
  }
}
