

import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/features/home/Time/model/pray_time_model.dart';

class TimeCard extends StatelessWidget {
  final PrayTimeModel prayTimeModel;
  const TimeCard({super.key, required this.prayTimeModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Container(
      width: width * 0.24,

      height: height * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.046),

        gradient: LinearGradient(
          colors: [AppColors.black, AppColors.brownBg],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(prayTimeModel.title, style: AppTextStyle.bold16white),
          Text(
            prayTimeModel.time,
            style: AppTextStyle.bold36white.copyWith(fontSize: 32),
          ),
          Text(prayTimeModel.or, style: AppTextStyle.bold16white),
        ],
      ),
    );
  }
}
