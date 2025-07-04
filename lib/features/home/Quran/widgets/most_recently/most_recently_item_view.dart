import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/core/utilities/quran_resources.dart';

class MostRecentlyItemView extends StatelessWidget {
  final int index;
  final List<int> mostRecentlyList;
  const MostRecentlyItemView({
    super.key,
    required this.mostRecentlyList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(width * 0.03),
      width: width * 0.65,
      height: height * 0.16,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(width * 0.046),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  QuranResources.englishQuranSurahs[mostRecentlyList[index]],
                  style: AppTextStyle.bold24Black,
                ),
                Text(
                  QuranResources.arabicQuranSuras[mostRecentlyList[index]],
                  style: AppTextStyle.bold24Black,
                ),
                Text(
                  "${QuranResources.ayaNumber[mostRecentlyList[index]]} Verses",
                  style: AppTextStyle.w40016Black,
                ),
              ],
            ),
          ),
          Image.asset(AppAssets.mostRecently, width: width * 0.35),
        ],
      ),
    );
  }
}
