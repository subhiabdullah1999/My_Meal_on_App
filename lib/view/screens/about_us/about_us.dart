import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:My_Meal_on/view/widget/home/customdevider.dart';
import 'package:My_Meal_on/view/widget/settings/customBackIcon.dart';
import 'package:My_Meal_on/view/widget/settings/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: ListView(children: [
              Row(children: [
                CustomBackIcon(onPressed: () {
                  Get.back();
                }),
                const CustomTitle(
                  texttitle: "about_us",
                ),
                const Spacer(),
              ]),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  ),
                  Text(
                    "My Meal_on",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(
                    color: AppColors.oraColor,
                    endIndent: 50,
                    thickness: 3,
                    indent: 50,
                  ),
                ],
              ),
              ListTile(
                title: Center(
                  child: Text("who are we".tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: Text("who are we descr".tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              ListTile(
                title: Center(
                  child: Text("The goal of the application".tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("gooalOne".tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    Text("gooalTow".tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    Text("gooalThree".tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              ListTile(
                title: Center(
                  child: Text("Application features".tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("features1".tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    Text("features2".tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    Text("features3".tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              ListTile(
                title: Center(
                  child: Text("Contact the application team".tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+9647827161393"));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: AppColors.redcolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("contact_us".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.redcolor)),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              const SizedBox(
                height: 20,
              )
            ])),
      ),
    );
  }
}
