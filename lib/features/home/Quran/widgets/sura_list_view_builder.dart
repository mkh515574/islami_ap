import 'package:flutter/material.dart';
import 'package:islamic_app/core/services/shared_prefs.dart';

import 'package:islamic_app/features/home/Quran/widgets/quran_screen_details/sura_details_screen.dart';
import 'package:islamic_app/features/home/Quran/widgets/sura_view_item.dart';

class SuraListViewBuilder extends StatelessWidget {
  final List<int> filterList;
  const SuraListViewBuilder({super.key, required this.filterList});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {

            saveLastSuraIndex(filterList[index]);
            Navigator.pushNamed(
              context,
              SuraDetailsScreen.routeName,
              arguments: filterList[index],
            );
          },
          child: SuraViewItem(index: filterList[index]),
        ),

        itemCount: filterList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey[300],
          thickness: 1,
          indent: width * 0.1,
          endIndent: width * 0.1,
          height: 1,
        ),
      ),
    );
  }
}
