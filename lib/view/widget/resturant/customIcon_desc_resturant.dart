import 'package:flutter/material.dart';

class CustomIconDescrResturant extends StatelessWidget {
  final IconData icon;
  final Color? colorIcon;
  final Color? colorCircle;

  const CustomIconDescrResturant(
      {super.key, required this.icon, this.colorIcon, this.colorCircle});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 13,
      child: Icon(
        icon,
        color: colorIcon,
      ),
      backgroundColor: colorCircle,
    );
  }
}
