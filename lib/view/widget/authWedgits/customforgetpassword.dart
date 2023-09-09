import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomForgetPasswordWidget extends StatelessWidget {
  final void Function()? onTab;
  final String text;
  const CustomForgetPasswordWidget({super.key, this.onTab, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: InkWell(
        onTap: onTab,
        child: Text(
          text.tr,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
