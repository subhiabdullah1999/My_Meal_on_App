import 'package:My_Meal_on/core/class/handlingdata.dart';
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

import '../../../controller/forgetpassword/veryficontroller.dart';
import '../../widget/authWedgits/customotptext.dart';

class VeryfiCode extends StatelessWidget {
  const VeryfiCode({super.key});

  @override
  Widget build(BuildContext context) {
    VeryfiCodeControllerImp controller = Get.put(VeryfiCodeControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        // title: Text(
        //   "check_code".tr,
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
      body: GetBuilder<VeryfiCodeControllerImp>(
          builder: (controller) => HandlingDatatRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const CustomVeryFiPhone(),
                      Column(
                        children: [
                          const CustomDiscTextWidget(discText: "send_code"),
                          Text("${controller.phonenumber}")
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomOTPText(
                        submite: (String codver) {
                          // controller.goToHome(codver);
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
                          onPressed: () {
                            Get.offNamed(AppRoutsName.resetPassword,
                                arguments: {
                                  "phoneNumber": controller.phonenumber
                                });
                          }),
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
                                Get.offNamed(AppRoutsName.resetPassword);
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
