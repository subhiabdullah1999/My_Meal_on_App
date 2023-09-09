import "package:My_Meal_on/controller/authcontrooler/changepasswordcontroller.dart";
import "package:My_Meal_on/controller/authcontrooler/signupcontroller.dart";
import "package:My_Meal_on/core/class/handlingdata.dart";

import "package:My_Meal_on/core/constans/appColors.dart";
import "package:My_Meal_on/core/functions/validinput.dart";
import "package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart";
import "package:My_Meal_on/view/widget/profile/customformchangepassword.dart";
import "package:My_Meal_on/view/widget/settings/customBackIcon.dart";
import "package:My_Meal_on/view/widget/settings/customtitle.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordControllerImp());

    return GetBuilder<ChangePasswordControllerImp>(
        builder: (controller) => Scaffold(
              body: Container(
                color: AppColors.whiteColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: ListView(
                  children: [
                    Row(children: [
                      CustomBackIcon(onPressed: () {
                        controller.goBack();
                      }),
                      const CustomTitle(
                        texttitle: "ChangePassword",
                      )
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    HandlingDatatRequest(
                        statusRequest: controller.statusRequest,
                        widget: Column(
                          children: [
                            Form(
                                key: controller.formstate,
                                child: Column(
                                  children: [
                                    GetBuilder<ChangePasswordControllerImp>(
                                      builder: (controller) =>
                                          CustomTextFormChangePass(
                                        mycontroller:
                                            controller.currentPassword,
                                        valid: (valeu) {
                                          return validInput(
                                              valeu!, 6, 30, "password");
                                        },
                                        label: Text(
                                          "current password".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.blackColors7,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obsc: controller.isShowwPassword,
                                        suffixicon:
                                            controller.isShowwPassword == true
                                                ? Icons.remove_red_eye_outlined
                                                : Icons.energy_savings_leaf,
                                        ontapIcon: () {
                                          controller.showPassword();
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    GetBuilder<ChangePasswordControllerImp>(
                                      builder: (controllerImp) =>
                                          CustomTextFormChangePass(
                                        mycontroller: controller.password,
                                        valid: (valeu) {
                                          return validInput(
                                              valeu!, 6, 30, "password");
                                        },
                                        label: Text(
                                          "New password".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.blackColors7,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obsc: controllerImp.isShowwPassword,
                                        suffixicon:
                                            controllerImp.isShowwPassword ==
                                                    true
                                                ? Icons.remove_red_eye_outlined
                                                : Icons.energy_savings_leaf,
                                        ontapIcon: () {
                                          controllerImp.showPassword();
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    GetBuilder<ChangePasswordControllerImp>(
                                      builder: (controllerImp) =>
                                          CustomTextFormChangePass(
                                        mycontroller:
                                            controller.passwordConfirmation,
                                        valid: (valeu) {
                                          return validInput(
                                              valeu!, 6, 30, "password");
                                        },
                                        label: Text(
                                          "COnfirm password".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.blackColors7,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obsc: controllerImp.isShowwPassword,
                                        suffixicon:
                                            controllerImp.isShowwPassword ==
                                                    true
                                                ? Icons.remove_red_eye_outlined
                                                : Icons.energy_savings_leaf,
                                        ontapIcon: () {
                                          controllerImp.showPassword();
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 250,
                            ),
                            CustomButtonAuthWidget(
                                color: AppColors.oraColor,
                                widthleft: 20,
                                widthright: 20,
                                textButt: "Change Password",
                                onPressed: () {
                                  controller.chagePassword();
                                }),
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }
}
