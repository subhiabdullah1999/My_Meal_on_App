import 'package:My_Meal_on/controller/authcontrooler/logincontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';
import 'package:My_Meal_on/core/functions/validinput.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customLogoWidget.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customTextFormAuth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonSigninSignUP.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customforgetpassword.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customtextsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.put(LogInControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: WillPopScope(
          onWillPop: alertDialogExitApp,
          child: GetBuilder<LogInControllerImp>(
              builder: (controller) => HandlingDatatRequest(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const CustomLogoWidget(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSignAndLogin(
                                horiz: 55,
                                tople: 30,
                                topri: 30,
                                botlef: 30,
                                botrig: 30,
                                color: AppColors.oraColor,
                                text: "sinIn",
                                widthleft: 0,
                                widthright: 0,
                                colortext: AppColors.whiteColor,
                                ontap: () {},
                              ),
                              CustomSignAndLogin(
                                horiz: 30,
                                topri: myServices.sharedPreferences
                                            .getString("lang") ==
                                        "ar"
                                    ? 0
                                    : 30,
                                tople: myServices.sharedPreferences
                                            .getString("lang") ==
                                        "ar"
                                    ? 30
                                    : 0,
                                botlef: myServices.sharedPreferences
                                            .getString("lang") ==
                                        "ar"
                                    ? 30
                                    : 0,
                                botrig: myServices.sharedPreferences
                                            .getString("lang") ==
                                        "ar"
                                    ? 0
                                    : 30,
                                color: AppColors.whiteColor2,
                                text: "signup",
                                widthleft: 0,
                                widthright: 0,
                                colortext: AppColors.redcolor,
                                ontap: () {
                                  controller.goToSignUp();
                                },
                              )
                            ],
                          ),
                          CustomTextFormAuthWidget(
                              valid: (valeu) {
                                return validInput(valeu!, 3, 20, "phone");
                              },
                              mycontroller: controller.phonenumber,
                              keyboardType: TextInputType.phone,
                              hintText: "mobile_number",
                              iconData: Icons.mobile_friendly_outlined),
                          GetBuilder<LogInControllerImp>(
                            builder: (controller) => CustomTextFormAuthWidget(
                              obsc: controller.isShowwPassword,
                              valid: (valeu) {
                                return validInput(valeu!, 6, 30, "password");
                              },
                              mycontroller: controller.password,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "password",
                              iconData: controller.isShowwPassword == true
                                  ? Icons.lock_clock_outlined
                                  : Icons.lock_open,
                              ontapIcon: () {
                                controller.showPassword();
                              },
                            ),
                          ),
                          CustomForgetPasswordWidget(
                              text: "forget_password",
                              onTab: () {
                                controller.goToForgetPassword();
                              }),
                          CustomButtonAuthWidget(
                              color: AppColors.oraColor,
                              widthleft: 30,
                              widthright: 30,
                              textButt: "sinIn",
                              onPressed: () {
                                controller.logIn();
                              }),
                          CustomTextSignUpOrLogin(
                            textone: "no_account",
                            textTow: "signup",
                            onTap: () {
                              controller.goToSignUp();
                            },
                          ),
                        ],
                      ),
                    ),
                  ))),
    ));
  }
}
