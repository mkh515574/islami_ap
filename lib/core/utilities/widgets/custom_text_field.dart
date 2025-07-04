import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const CustomTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.bold20white,
      onChanged: onChanged,
      cursorColor: AppColors.gold,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold, width: 2.0),
        ),
        prefixIcon: ImageIcon(AssetImage(AppAssets.quranLogo)),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white),
        prefixIconColor: AppColors.gold,
      ),
    );
  }
}
