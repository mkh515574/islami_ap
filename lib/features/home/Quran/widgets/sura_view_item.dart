import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/core/utilities/quran_resources.dart';

class SuraViewItem extends StatelessWidget {
  final int index;
  const SuraViewItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      width: width,
      height: height * 0.067,

      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text("${index + 1}", style: AppTextStyle.bold20white),
              Image.asset(AppAssets.quranListLogo),
            ],
          ),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  QuranResources.englishQuranSurahs[index],
                  style: AppTextStyle.bold20white,
                ),
                Text(
                  "${QuranResources.ayaNumber[index]} Verses",
                  style: AppTextStyle.bold16white,
                ),
              ],
            ),
          ),

          Text(
            QuranResources.arabicQuranSuras[index],
            style: AppTextStyle.bold20white,
          ),
        ],
      ),
    );
  }
}
