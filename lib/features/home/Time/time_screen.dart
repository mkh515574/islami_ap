
import 'package:flutter/material.dart';

import 'package:islamic_app/core/constants/app_text_style.dart';

import 'package:islamic_app/features/home/Time/widgets/azkar_view_item.dart';
import 'package:islamic_app/features/home/Time/widgets/pray_time_view.dart';


import '../../../core/constants/app_assets.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.timeBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.logo),
            PrayTimeView(),

            SizedBox(height: height * 0.04),
            Container(
              margin: EdgeInsets.only(left: width * 0.05),
              alignment: Alignment.topLeft,
              child: Text("Azkar", style: AppTextStyle.bold20white),
            ),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AzkarViewItem(),
                separatorBuilder: (context, index) => SizedBox(width: width * 0.04),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
