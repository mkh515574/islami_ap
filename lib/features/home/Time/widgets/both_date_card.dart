import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

class BothDateCard extends StatelessWidget {
  const BothDateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: width * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("16 Jul,\n2024", style: AppTextStyle.bold16white),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: height * 0.01),
                Text("Pray Time", style: AppTextStyle.bold20Black),
                SizedBox(height: height * 0.02),
                Text("Tuesday", style: AppTextStyle.bold20Black),
              ],
            ),
          ),
          Text("09 Muh,\n1446", style: AppTextStyle.bold16white),
        ],
      ),
    );
  }
}
