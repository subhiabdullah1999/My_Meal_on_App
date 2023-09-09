import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSignAndLogin extends StatelessWidget {
  final void Function()? ontap;
  final double widthright;
  final double widthleft;
  final double botlef;
  final double botrig;
  final double tople;
  final double topri;
  final double horiz;

  final String text;
  final Color color;
  final Color colortext;

  const CustomSignAndLogin(
      {super.key,
      required this.ontap,
      required this.widthright,
      required this.widthleft,
      required this.text,
      required this.color,
      required this.colortext,
      required this.botlef,
      required this.botrig,
      required this.tople,
      required this.topri,
      required this.horiz});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: widthright, left: widthleft),
        padding: EdgeInsets.symmetric(horizontal: horiz, vertical: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(botlef),
                topLeft: Radius.circular(tople),
                topRight: Radius.circular(topri),
                bottomRight: Radius.circular(botrig))),
        child: Text(
          text.tr,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: colortext, fontSize: 15),
        ),
      ),
    );
  }
}
