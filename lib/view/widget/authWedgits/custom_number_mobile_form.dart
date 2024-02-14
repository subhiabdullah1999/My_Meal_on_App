import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomNumberMobileWidget extends StatelessWidget {
  final String? hintText;
  final IconData? iconData;
  final IconData? suffixicon;
  final String? codeCuntry;

  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final void Function()? ontapIcon;

  final bool? obsc;

  final void Function(PhoneNumber?)? fullNumber;

  const CustomNumberMobileWidget(
      {super.key,
      this.hintText,
      this.iconData,
      this.keyboardType,
      required this.mycontroller,
      required this.valid,
      this.obsc,
      this.ontapIcon,
      this.suffixicon,
      this.codeCuntry,
      required this.fullNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: IntlPhoneField(
        onChanged: fullNumber,
        initialCountryCode: "IQ",
        cursorColor: AppColors.oraColor,
        obscureText: obsc == null || obsc == false ? false : true,
        // validator: valid,
        controller: mycontroller,
        // keyboardType: keyboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText!.tr,
          suffixIcon: InkWell(
            onTap: ontapIcon,
            child: Icon(suffixicon),
          ),
          suffixIconColor: obsc == false ? AppColors.redcolor : AppColors.gry2,
          prefixIcon: InkWell(
            child: Icon(
              iconData,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.5, horizontal: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          filled: true,
          fillColor: AppColors.whiteColor3,
        ),
      ),
    );
  }
}
