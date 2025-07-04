import 'package:flutter/material.dart';

import 'package:islamic_app/core/constants/app_text_style.dart';

import 'package:islamic_app/features/home/Quran/controller/most_recent_provider.dart';
import 'package:islamic_app/features/home/Quran/widgets/most_recently/most_recently_list_view.dart';

import 'package:provider/provider.dart';


class MostRecentlyCard extends StatefulWidget {
  const MostRecentlyCard({super.key});

  @override
  State<MostRecentlyCard> createState() => _MostRecentlyCardState();
}

class _MostRecentlyCardState extends State<MostRecentlyCard> {

  late MostRecentProvider mostRecently;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecently.readLastSuraList();
    });


  }


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
     mostRecently = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecently.mostRecentlyList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02),
          Text("Most Recently", style: AppTextStyle.bold16white),
          SizedBox(height: height * 0.02),
          MostRecentlyListView(mostRecentlyList: mostRecently.mostRecentlyList),

        ],
      ),
    );
  }
}
