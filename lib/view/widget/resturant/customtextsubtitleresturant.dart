import 'package:flutter/material.dart';

class CustomTextSubTileResturant extends StatelessWidget {
  final String subtitle;
  const CustomTextSubTileResturant({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18,
          ),
    );
  }
}
