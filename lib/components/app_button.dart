import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class AppButton extends StatelessWidget {
  Function()? onTap;
  String title;
  double? height;

  AppButton({super.key, this.onTap, required this.title,this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 40,
      onPressed: onTap,
      color: AppColors.themeColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
