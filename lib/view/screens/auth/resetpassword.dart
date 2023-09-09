import 'package:My_Meal_on/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/class/loading.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/validinput.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customDiscText.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customLogoWidget.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customTextFormAuth.dart';

import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customtextresetpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResPasswordControllerImp controller = Get.put(ResPasswordControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 0.0,
            // title: Text(
            //   "re_passwprd".tr,
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleLarge!
            //       .copyWith(color: AppColors.blackColor),
            // ),
            // centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  controller.goToForgetPassword();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.blackColors,
                  size: 30,
                )),
          ),
          body: GetBuilder<ResPasswordControllerImp>(
              builder: (controller) => HandlingDatatRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          const CustomTextResetPassword(),
                          const CustomDiscTextWidget(
                              discText: "enter_new_pass"),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<ResPasswordControllerImp>(
                            builder: (controller) => CustomTextFormAuthWidget(
                              valid: (valeu) {
                                return validInput(valeu!, 6, 30, "password");
                              },
                              mycontroller: controller.password,
                              keyboardType: TextInputType.visiblePassword,
                              obsc: controller.isShowwPassword,
                              hintText: "password",
                              iconData: controller.isShowwPassword == true
                                  ? Icons.lock_clock_outlined
                                  : Icons.lock_open,
                              ontapIcon: () {
                                controller.showPassword();
                              },
                            ),
                          ),
                          GetBuilder<ResPasswordControllerImp>(
                            builder: (controller) => CustomTextFormAuthWidget(
                              valid: (valeu) {
                                return validInput(valeu!, 6, 30, "password");
                              },
                              mycontroller: controller.repassword,
                              keyboardType: TextInputType.visiblePassword,
                              obsc: controller.isShowwPassword,
                              hintText: "re_enter_new_pass",
                              iconData: controller.isShowwPassword == true
                                  ? Icons.lock_clock_outlined
                                  : Icons.lock_open,
                              ontapIcon: () {
                                controller.showPassword();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          CustomButtonAuthWidget(
                              color: AppColors.oraColor,
                              widthleft: 1,
                              widthright: 1,
                              textButt: "ok",
                              onPressed: () {
                                controller.ok();
                              }),
                        ],
                      ),
                    ),
                  )))),
    );
  }
}
