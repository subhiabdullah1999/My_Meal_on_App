import 'package:My_Meal_on/controller/authcontrooler/signupcontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/functions/alertdialogexitapp.dart';
import 'package:My_Meal_on/core/functions/validinput.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customLogoWidget.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customTextFormAuth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custom_number_mobile_form.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonSigninSignUP.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customtextsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: WillPopScope(
          onWillPop: alertDialogExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controllerImp) => HandlingDatatRequest(
                statusRequest: controllerImp.statusRequest,
                widget: Form(
                  key: controllerImp.formstate,
                  child: ListView(
                    children: [
                      const CustomLogoWidget(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSignAndLogin(
                            horiz: 30,
                            tople: myServices.sharedPreferences
                                        .getString("lang") ==
                                    "ar"
                                ? 0
                                : 30,
                            topri: myServices.sharedPreferences
                                        .getString("lang") ==
                                    "ar"
                                ? 30
                                : 0,
                            botlef: myServices.sharedPreferences
                                        .getString("lang") ==
                                    "ar"
                                ? 0
                                : 30,
                            botrig: myServices.sharedPreferences
                                        .getString("lang") ==
                                    "ar"
                                ? 30
                                : 0,
                            color: AppColors.whiteColor2,
                            text: "sinIn",
                            widthleft: 0,
                            widthright: 0,
                            colortext: AppColors.redcolor,
                            ontap: () {
                              controllerImp.goToLogIn();
                            },
                          ),
                          CustomSignAndLogin(
                            horiz: 50,
                            topri: 30,
                            tople: 30,
                            botlef: 30,
                            botrig: 30,
                            color: AppColors.oraColor,
                            text: "signup",
                            widthleft: 0,
                            widthright: 0,
                            colortext: AppColors.whiteColor,
                            ontap: () {},
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormAuthWidget(
                          valid: (valeu) {
                            if (valeu!.length < 2 || valeu.length > 40) {
                              return "valid_username".tr;
                            }
                            ;
                          },
                          mycontroller: controllerImp.userName,
                          keyboardType: TextInputType.name,
                          hintText: "your_name",
                          iconData: Icons.person_2_outlined),
                      CustomNumberMobileWidget(
                          fullNumber: (val) {
                            controllerImp.fullphonenumber =
                                val!.completeNumber.toString();
                            print(controllerImp.fullphonenumber);
                          },
                          valid: (valeu) {
                            return validInput(valeu!, 3, 30, "phone");
                          },
                          mycontroller: controllerImp.phonenumber,
                          keyboardType: TextInputType.phone,
                          hintText: "mobile_number",
                          iconData: Icons.mobile_friendly_outlined),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controllerImp) => CustomTextFormAuthWidget(
                          valid: (valeu) {
                            return validInput(valeu!, 6, 30, "password");
                          },
                          mycontroller: controllerImp.password,
                          keyboardType: TextInputType.visiblePassword,
                          obsc: controllerImp.isShowwPassword,
                          hintText: "password",
                          suffixicon: controllerImp.isShowwPassword == true
                              ? Icons.remove_red_eye_outlined
                              : Icons.energy_savings_leaf,
                          ontapIcon: () {
                            controllerImp.showPassword();
                          },
                          iconData: controllerImp.isShowwPassword == true
                              ? Icons.lock_clock_outlined
                              : Icons.lock_open,
                        ),
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controllerImp) => CustomTextFormAuthWidget(
                          valid: (valeu) {
                            return validInput(valeu!, 6, 30, "password");
                          },
                          mycontroller: controllerImp.repassword,
                          keyboardType: TextInputType.visiblePassword,
                          obsc: controllerImp.isShowwPassword,
                          hintText: "Re_password",
                          suffixicon: controllerImp.isShowwPassword == true
                              ? Icons.remove_red_eye_outlined
                              : Icons.energy_savings_leaf,
                          ontapIcon: () {
                            controllerImp.showPassword();
                          },
                          iconData: controllerImp.isShowwPassword == true
                              ? Icons.lock_clock_outlined
                              : Icons.lock_open,
                        ),
                      ),
                      CustomButtonAuthWidget(
                          color: AppColors.oraColor,
                          widthleft: 20,
                          widthright: 20,
                          textButt: "signup",
                          onPressed: () {
                            controllerImp.signUp();
                          }),
                      CustomTextSignUpOrLogin(
                        textone: "have_account",
                        textTow: "sinIn",
                        onTap: () {
                          controllerImp.goToLogIn();
                        },
                      ),
                    ],
                  ),
                )),
          )),
    ));
  }
}
