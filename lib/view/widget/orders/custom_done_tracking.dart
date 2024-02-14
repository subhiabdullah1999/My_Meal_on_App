import 'package:flutter/material.dart';

class DoneTracking extends StatelessWidget {
  final Color? colorCircel;
  final Color? colorIconDone;

  const DoneTracking(
      {super.key, required this.colorCircel, required this.colorIconDone});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorCircel,
      radius: 30,
      child: Icon(
        Icons.done_outline,
        color: colorIconDone,
        size: 40,
      ),
    );
  }
}
