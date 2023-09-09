import "package:My_Meal_on/controller/authcontrooler/changepasswordcontroller.dart";
import "package:My_Meal_on/controller/authcontrooler/signupcontroller.dart";
import "package:My_Meal_on/controller/profile/profilecontroller.dart";
import "package:My_Meal_on/core/class/handlingdata.dart";

import "package:My_Meal_on/core/constans/appColors.dart";
import "package:My_Meal_on/core/functions/handlingdatacontroller.dart";
import "package:My_Meal_on/core/functions/validinput.dart";
import "package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart";
import "package:My_Meal_on/view/widget/profile/customcontainerpssword.dart";
import "package:My_Meal_on/view/widget/profile/customformchangepassword.dart";
import "package:My_Meal_on/view/widget/settings/customBackIcon.dart";
import "package:My_Meal_on/view/widget/settings/customtitle.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class EditeProfile extends StatelessWidget {
  const EditeProfile({super.key});

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
                        texttitle: "editeProfile",
                      )
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    HandlingDatat(
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
                                            controller.controllerImp.userName,
                                        valid: (valeu) {
                                          return validInput(
                                              valeu!, 2, 50, "username");
                                        },
                                        label: Text(
                                          "Full name".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.blackColors7,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    GetBuilder<ChangePasswordControllerImp>(
                                      builder: (controllerImp) =>
                                          CustomTextFormChangePass(
                                        mycontroller: controller
                                            .controllerImp.phonenumber,
                                        valid: (valeu) {
                                          return validInput(
                                              valeu!, 6, 30, "phone");
                                        },
                                        label: Text(
                                          "Phone number".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.blackColors7,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        keyboardType: TextInputType.phone,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    GetBuilder<ProfileControllerImp>(
                                      builder: (controllerImp) =>
                                          CustomTextFormChangePass(
                                        mycontroller:
                                            controller.controllerImp.emaile,
                                        valid: (valeu) {
                                          return validInput(
                                              valeu!, 6, 30, "password");
                                        },
                                        label: Text(
                                          "email".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.blackColors7,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    CustomContainerPassword(
                                      textbutton: "Change",
                                      ontap: () {
                                        controller.controllerImp
                                            .goToChanePassord();
                                      },
                                      texttitle: "PAssword",
                                      textcontant: "************",
                                    ),
                                  ],
                                )),
                            CustomButtonAuthWidget(
                                color: AppColors.oraColor,
                                widthleft: 20,
                                widthright: 20,
                                textButt: "Change settings",
                                onPressed: () {
                                  controller.controllerImp.editProfile();
                                }),
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }
}
