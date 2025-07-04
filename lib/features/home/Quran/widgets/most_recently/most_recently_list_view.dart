import 'package:flutter/material.dart';
import 'package:islamic_app/core/services/shared_prefs.dart';

import 'package:islamic_app/features/home/Quran/widgets/most_recently/most_recently_item_view.dart';

import 'package:islamic_app/features/home/Quran/widgets/quran_screen_details/sura_details_screen.dart';

class MostRecentlyListView extends StatelessWidget {
  final List<int> mostRecentlyList;
  const MostRecentlyListView({super.key, required this.mostRecentlyList});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.16,
      child: ListView.separated(
        itemCount: mostRecentlyList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            saveLastSuraIndex(mostRecentlyList[index]);
            Navigator.pushNamed(
              context,
              SuraDetailsScreen.routeName,
              arguments: mostRecentlyList[index],
            );
          },
          child: MostRecentlyItemView(
            mostRecentlyList: mostRecentlyList,
            index: index,
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: width * 0.02),
      ),
    );
  }
}
