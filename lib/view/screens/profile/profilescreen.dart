import "package:My_Meal_on/controller/profile/profilecontroller.dart";
import "package:My_Meal_on/core/constans/appColors.dart";
import "package:My_Meal_on/core/services/services.dart";
import "package:My_Meal_on/view/widget/authWedgits/custombuttonauth.dart";
import "package:My_Meal_on/view/widget/profile/customcontainerprofile.dart";
import "package:My_Meal_on/view/widget/profile/customcontainerpssword.dart";
import "package:My_Meal_on/view/widget/settings/customBackIcon.dart";
import "package:My_Meal_on/view/widget/settings/customtitle.dart";

import "package:flutter/material.dart";
import "package:get/get.dart";

class ProfileScrren extends StatelessWidget {
  const ProfileScrren({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    Get.put(ProfileControllerImp());
    return GetBuilder<ProfileControllerImp>(
        builder: (controller) => Scaffold(
              body: Container(
                color: AppColors.whiteColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: ListView(
                  children: [
                    Row(children: [
                      CustomBackIcon(
                        onPressed: () {
                          controller.iconBackProfileScreenSettings();
                        },
                      ),
                      const CustomTitle(
                        texttitle: "ProfileInformation",
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomContainerProfile(
                      texttitle: "Full name",
                      textcontant:
                          myServices.sharedPreferences.getString("username")!,
                    ),
                    CustomContainerProfile(
                      texttitle: "Phone number",
                      textcontant:
                          myServices.sharedPreferences.getString("phone")!,
                    ),
                    CustomContainerProfile(
                      texttitle: "email",
                      textcontant:
                          myServices.sharedPreferences.getString("email")!,
                    ),
                    CustomContainerPassword(
                      textbutton: "Change",
                      ontap: () {
                        controller.goToChanePassord();
                      },
                      texttitle: "PAssword",
                      textcontant: "************",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuthWidget(
                        color: AppColors.oraColor,
                        widthleft: 20,
                        widthright: 20,
                        textButt: "Change settings",
                        onPressed: () {
                          controller.iconEditeProfile();
                        }),
                  ],
                ),
              ),
            ));
  }
}
