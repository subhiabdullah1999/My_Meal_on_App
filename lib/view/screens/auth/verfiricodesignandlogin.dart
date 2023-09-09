import 'package:My_Meal_on/controller/authcontrooler/verficodesignandlogincontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/class/loading.dart';
import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customDiscText.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customLogoWidget.dart';
import 'package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customforgetpassword.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customtextsignup.dart';
import 'package:My_Meal_on/view/widget/authWedgits/customveryfiphone.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/authWedgits/customotptext.dart';

class VerFiriCodeSignAndLOgIn extends StatelessWidget {
  const VerFiriCodeSignAndLOgIn({super.key});

  @override
  Widget build(BuildContext context) {
    VeryfiCodeSignAndLogInControllerImp controller =
        Get.put(VeryfiCodeSignAndLogInControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              controller.goToLogIn();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.blackColors,
              size: 30,
            )),
      ),
      body: GetBuilder<VeryfiCodeSignAndLogInControllerImp>(
          builder: (controller) => HandlingDatatRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const CustomVeryFiPhone(),
                      const CustomDiscTextWidget(discText: "send_code"),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomOTPText(
                        submite: (String codver) {
                          controller.goToHome(codver);
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButtonAuthWidget(
                          color: AppColors.oraColor,
                          widthleft: 5,
                          widthright: 5,
                          textButt: "Verify",
                          onPressed: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextSignUpOrLogin(
                        textone: "Didn't receive code",
                        textTow: "Request again",
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomForgetPasswordWidget(
                              text: "Change Number",
                              onTab: () {
                                controller.changeNumber();
                              }),
                          const Divider(
                            color: AppColors.oraColor,
                            thickness: 3,
                            indent: 100,
                            endIndent: 100,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
    ));
  }
}
