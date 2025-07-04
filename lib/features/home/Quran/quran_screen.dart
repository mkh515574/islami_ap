import 'package:flutter/material.dart';
import 'package:islamic_app/core/utilities/quran_resources.dart';
import 'package:islamic_app/features/home/Quran/widgets/most_recently/most_recently_card.dart';

import 'package:islamic_app/features/home/Quran/widgets/sura_list_view_builder.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/utilities/widgets/custom_text_field.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> allSuras = List.generate(114, (index) => index);
  List<int> filterList = [];

  @override
  void initState() {
    super.initState();
    filterList = List.from(allSuras);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBg),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.046),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(AppAssets.logo)),
              SizedBox(height: height * 0.02),
              CustomTextField(
                onChanged: (value) {
                  searchBySuraName(value);
                },
              ),

              SizedBox(height: height * 0.02),
              MostRecentlyCard(),
              SizedBox(height: height * 0.02),
              Text("Suras List", style: AppTextStyle.bold16white),
              SizedBox(height: height * 0.02),
              SuraListViewBuilder(filterList: filterList),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  void searchBySuraName(String value) {
    List<int> tempList = [];

    for (int i = 0; i < allSuras.length; i++) {
      if (QuranResources.englishQuranSurahs[i].toLowerCase().contains(
            value.toLowerCase(),
          ) ||
          QuranResources.arabicQuranSuras[i].toLowerCase().contains(
            value.toLowerCase(),
          )) {
        tempList.add(i);
      }
    }

    setState(() {
      filterList = tempList;
    });
  }
}
