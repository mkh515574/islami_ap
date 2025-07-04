import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/features/home/Hadith/model/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  final int index;
  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadethModel;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      loadingHadeth(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.only(
        top: size.height * 0.04,
        bottom: size.height * 0.01,
      ),
      padding: EdgeInsets.all(size.width * 0.04),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithBody),

          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(size.width * 0.05),
        color: AppColors.gold,
      ),
      child: hadethModel == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      hadethModel?.title ?? "",
                      style: AppTextStyle.bold24Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    hadethModel?.content ?? "",
                    textDirection: TextDirection.rtl,
                    style: AppTextStyle.bold16Black,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }

  void loadingHadeth(int index) async {
    String text = await rootBundle.loadString(
      "assets/files/Hadeeth/h$index.txt",
    );

    String title = text.substring(0, text.indexOf("\n"));
    String body = text.substring(text.indexOf("\n") + 1);
    hadethModel = HadethModel(title: title, content: body);

    setState(() {});
  }
}
