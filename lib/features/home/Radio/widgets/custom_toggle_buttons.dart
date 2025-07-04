import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'custom_button_row.dart';

class CustomToggleButtons extends StatelessWidget {
  final bool isFirstSelected;
  final String firstTitle;
  final String secondTitle;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  const CustomToggleButtons({
    super.key,
    required this.isFirstSelected,
    required this.firstTitle,
    required this.secondTitle,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.046,
        vertical: height * 0.02,
      ),
      width: double.infinity,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: AppColors.blackBg.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(width * 0.05),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButtonRow(
              title: firstTitle,
              isSelected: isFirstSelected,
              onTap: onFirstTap,
            ),
          ),
          Expanded(
            child: CustomButtonRow(
              title: secondTitle,
              isSelected: !isFirstSelected,
              onTap: onSecondTap,
            ),
          ),
        ],
      ),
    );
  }
}
