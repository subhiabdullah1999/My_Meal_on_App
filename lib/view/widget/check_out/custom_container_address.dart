import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

class CustomContainerAddress extends StatelessWidget {
  final String city;
  final String strret;
  final String building;
  final String number;
  final String nameaddress;
  final bool isactive;

  const CustomContainerAddress(
      {super.key,
      required this.city,
      required this.strret,
      required this.building,
      required this.number,
      required this.nameaddress,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive == true ? AppColors.oraColor : AppColors.whiteColor,
      shape: BeveledRectangleBorder(
          side: const BorderSide(
            color: AppColors.oraColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        isThreeLine: true,
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  city,
                  style: TextStyle(
                      color: isactive == true
                          ? AppColors.whiteColor
                          : AppColors.blackColor3),
                ),
              ),
              Text(" - ",
                  style: TextStyle(
                      color: isactive == true
                          ? AppColors.whiteColor
                          : AppColors.blackColor3)),
              Flexible(
                  child: Text(strret,
                      style: TextStyle(
                          color: isactive == true
                              ? AppColors.whiteColor
                              : AppColors.blackColor3))),
              Text(" - ",
                  style: TextStyle(
                      color: isactive == true
                          ? AppColors.whiteColor
                          : AppColors.blackColor3)),
              Flexible(
                  child: Text(building,
                      style: TextStyle(
                          color: isactive == true
                              ? AppColors.whiteColor
                              : AppColors.blackColor3))),
            ],
          ),
        ),
        trailing: Text(number,
            style: TextStyle(
                color: isactive == true
                    ? AppColors.whiteColor
                    : AppColors.blackColor3)),
        title: Text(nameaddress,
            style: TextStyle(
                color: isactive == true
                    ? AppColors.whiteColor
                    : AppColors.blackColor3)),
      ),
    );
  }
}
