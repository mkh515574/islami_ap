import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

class AzkarViewItem extends StatelessWidget {
  const AzkarViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return   Container(
      width: width * 0.43,
      height: height * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.046),
        color: AppColors.blackBg.withValues(alpha: 0.5),
        border: Border.all(color: AppColors.gold, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/bell-icon 1.png",
            width: width * 0.43,
            height: height * 0.2,
          ),
          Text("Evening Azkar", style: AppTextStyle.bold20white),
        ],
      ),
    );
  }
}
