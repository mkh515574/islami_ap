import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

class CustomButtonRow extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  const CustomButtonRow({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.gold
              : AppColors.blackBg.withValues(alpha: 0.0),
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Text(
          title,
          style: isSelected
              ? AppTextStyle.bold20Black
              : AppTextStyle.bold20white,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
