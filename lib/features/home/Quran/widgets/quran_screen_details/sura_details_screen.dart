import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/core/utilities/quran_resources.dart';
import 'package:islamic_app/features/home/Quran/controller/most_recent_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "QuranScreenDetails";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = "";
  late MostRecentProvider mostRecently;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecently.readLastSuraList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecently = Provider.of<MostRecentProvider>(context);
    if (suraContent.isEmpty) {
      loadingQuran(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackBg,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          QuranResources.englishQuranSurahs[index],
          style: AppTextStyle.bold20gold,
        ),
        elevation: 0,
        backgroundColor: AppColors.blackBg,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.maskLeft1, width: width * 0.216),
                Text(
                  QuranResources.arabicQuranSuras[index],
                  style: AppTextStyle.bold20gold,
                ),
                Image.asset(AppAssets.maskRight,width: width*0.216,),
              ],
            ),
            SizedBox(height: height * 0.02),
            suraContent.isEmpty
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(color: AppColors.gold),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        suraContent,
                        style: AppTextStyle.bold20gold,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
            SizedBox(height: height * 0.02),
            Image.asset(AppAssets.mosqueBg),
          ],
        ),
      ),
    );
  }

  void loadingQuran(int index) async {
    String text = await rootBundle.loadString(
      "assets/files/suras/${index + 1}.txt",
    );

    List<String> lines = text.split("\n");
    for (int i = 0; i < lines.length; i++) {
      lines[i] += ' [${i + 1}] ';
    }
    suraContent = lines.join();

    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
