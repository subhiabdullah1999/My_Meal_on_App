import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/constans/appColors.dart';

class CustomOTPText extends StatelessWidget {
  final void Function(String)? submite;
  const CustomOTPText({super.key, this.submite});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      autoFocus: true,
      keyboardType: TextInputType.number,
      clearText: true,
      borderWidth: 1.5,
      fieldWidth: 55,

      borderRadius: BorderRadius.circular(15),
      enabledBorderColor: AppColors.oraColor,
      numberOfFields: 5,
      borderColor: const Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: submite, // end onSubmit
    );
  }
}
