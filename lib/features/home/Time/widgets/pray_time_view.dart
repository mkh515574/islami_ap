import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/features/home/Time/model/pray_time_model.dart';
import 'package:islamic_app/features/home/Time/widgets/both_date_card.dart';
import 'package:islamic_app/features/home/Time/widgets/time_card.dart';

class PrayTimeView extends StatelessWidget {
  PrayTimeView({super.key});
  final List<PrayTimeModel> prayTimeList = [
    PrayTimeModel(title: "Fajr", time: "04:30", or: "AM"),
    PrayTimeModel(title: "Dhuhr", time: "12:30", or: "PM"),
    PrayTimeModel(title: "Asr", time: "03:30", or: "PM"),
    PrayTimeModel(title: "Maghrib", time: "05:30", or: "PM"),
    PrayTimeModel(title: "Isha", time: "07:30", or: "PM"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.906,
      height: height * 0.322,
      decoration: BoxDecoration(
        color: AppColors.brown,
        image: DecorationImage(
          image: AssetImage(AppAssets.timeCard),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(width * 0.09),
      ),
      child: Column(
        children: [
          BothDateCard(),
          CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,

              enlargeCenterPage: true,
              enlargeFactor: 0.2,

              scrollDirection: Axis.horizontal,
              height: height * 0.15,
              viewportFraction: 0.28,
            ),
            items: prayTimeList.map((i) {
              return TimeCard(prayTimeModel: i);
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: width * 0.02,
            ),
            child: Row(
              children: [
                Spacer(),
                Text("Next Pray ", style: AppTextStyle.bold20Black),
                Text("- 02:32", style: AppTextStyle.bold20Black),
                Spacer(),
                Icon(Icons.volume_off, size: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
