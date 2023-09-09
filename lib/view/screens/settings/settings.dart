import 'package:My_Meal_on/controller/settings/settingscontroller.dart';
import 'package:My_Meal_on/core/class/handlingdata.dart';
import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/constans/langclass.dart';
import 'package:My_Meal_on/core/localization/localizationController.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customlistile.dart';
import 'package:My_Meal_on/view/widget/settings/customswichicon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:My_Meal_on/view/widget/settings/customtitlepart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    MyServices myServices = Get.find();
    String? sharedPrifLang = myServices.sharedPreferences.getString("lang");
    String? selectedItem = sharedPrifLang == "ar" ? "arabic".tr : "english".tr;
    ListLanguage lang_list = ListLanguage();

    return GetBuilder<SettingsControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: ListView(
                children: [
                  Row(children: [
                    CustomBackIcon(onPressed: () {
                      controller.goBack();
                    }),
                    const CustomTitle(
                      texttitle: "AccountSettings",
                    ),
                    const Spacer(),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomListTile(
                    textTitle: "ProfileInformation",
                    subTitle: "Changeyouraccountinformation",
                    iconLeading: Icons.person,
                    iconTrailling: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    onTap: () {
                      controller.goTOProfile();
                    },
                  ),
                  CustomListTile(
                    textTitle: "ChangePassword",
                    subTitle: "Changepassword",
                    iconLeading: Icons.lock,
                    iconTrailling: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    onTap: () {
                      controller.goToChangePassword();
                    },
                  ),
                  CustomListTile(
                    textTitle: "Locations",
                    subTitle: "deliverylocations",
                    iconLeading: Icons.location_pin,
                    iconTrailling: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    onTap: () {
                      controller.goToAddress();
                    },
                  ),
                  const CustomTitlePart(textTitle: "language"),
                  GetBuilder<LocalizationController>(
                      builder: (controller) => Container(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 2, top: 2),
                            height: 75,
                            width: 180,
                            decoration: BoxDecoration(
                                color: AppColors.blackColors8,
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButtonFormField<String>(
                                dropdownColor: AppColors.oraColor,
                                value: selectedItem,
                                items: lang_list.languageList
                                    .map((item) => DropdownMenuItem(
                                        onTap: () {
                                          if (item == "arabic".tr) {
                                            controller.changeLang("ar");
                                          } else if (item == "english".tr) {
                                            controller.changeLang("en");
                                          }
                                        },
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )))
                                    .toList(),
                                onChanged: (item) {
                                  selectedItem = item;
                                }),
                          )),
                  const CustomTitlePart(textTitle: "Notifications"),
                  CustomListTile(
                      textTitle: "PushNotifications",
                      subTitle: "For daily update you will get it",
                      iconLeading: Icons.notifications,
                      iconTrailling: CustomSwichIcon(
                        onchange: (val) {},
                        value: true,
                      )),
                  CustomListTile(
                      textTitle: "SMS Notifications",
                      subTitle: "For daily update you will get it",
                      iconLeading: Icons.notifications,
                      iconTrailling: CustomSwichIcon(
                        onchange: (val) {},
                        value: false,
                      )),
                  const CustomTitlePart(textTitle: "MOre"),
                  CustomListTile(
                    textTitle: "contact_us",
                    subTitle: "contact_us",
                    iconLeading: Icons.phone,
                    iconTrailling: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+9647827161393"));
                    },
                  ),
                  CustomListTile(
                    textTitle: "about_us",
                    subTitle: "about_us",
                    iconLeading: Icons.groups_sharp,
                    iconTrailling: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutsName.aboutUs);
                    },
                  ),
                  CustomListTile(
                    textTitle: "Rate Us",
                    subTitle: "Rate us playstore, appstor",
                    iconLeading: Icons.star,
                    iconTrailling: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    onTap: () {},
                  ),

                  // CustomListTile(
                  //   textTitle: "Faq",
                  //   subTitle: "FAQ",
                  //   iconLeading: Icons.book,
                  //   iconTrailling: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: AppColors.blackColor3,
                  //     size: 30,
                  //   ),
                  //   onTap: () {},
                  // ),
                  GetBuilder<SettingsControllerImp>(
                      builder: (controller) => HandlingDatat(
                            statusRequest: controller.statusRequest,
                            widget: Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 15),
                              child: CustomListTile(
                                textTitle: "Logout",
                                subTitle: "Logout",
                                iconLeading: Icons.logout_outlined,
                                iconTrailling: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.blackColor3,
                                  size: 30,
                                ),
                                onTap: () {
                                  controller.logOut();
                                },
                              ),
                            ),
                          )),
                ],
              ),
            ));
  }
}
