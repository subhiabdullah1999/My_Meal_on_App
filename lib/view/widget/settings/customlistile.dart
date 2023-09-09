import "package:My_Meal_on/controller/settings/settingscontroller.dart";
import "package:My_Meal_on/core/constans/appColors.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class CustomListTile extends StatelessWidget {
  final String textTitle;
  final String subTitle;
  final IconData? iconLeading;
  final Widget? iconTrailling;

  final void Function()? onTap;

  const CustomListTile(
      {super.key,
      required this.textTitle,
      required this.subTitle,
      required this.iconLeading,
      this.onTap,
      this.iconTrailling});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    return GetBuilder<SettingsControllerImp>(
        builder: (controller) => InkWell(
              onTap: onTap,
              child: Card(
                child: ListTile(
                    isThreeLine: true,
                    title: Text(
                      textTitle.tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                          color: AppColors.blackColor3,
                          fontWeight: FontWeight.w300),
                    ),
                    subtitle: Text(
                      subTitle.tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          color: AppColors.blackColors4,
                          fontWeight: FontWeight.w400),
                    ),
                    leading: Icon(
                      iconLeading,
                      color: AppColors.blackColor3,
                      size: 30,
                    ),
                    trailing: iconTrailling),
              ),
            ));
  }
}
