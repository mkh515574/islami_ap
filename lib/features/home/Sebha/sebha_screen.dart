

import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/features/home/Sebha/widget/sebha_item.dart';

import '../../../core/constants/app_assets.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;

  String currentZikr = 'سبحان الله';

  final List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  void incrementCounter() {
    setState(() {
      count++;
      if (count % 33 == 0) {
        int currentIndex = azkar.indexOf(currentZikr);
        currentZikr = azkar[(currentIndex + 1) % azkar.length];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.logo),
            SizedBox(height: height * 0.04),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                    style: AppTextStyle.bold36white,
                  ),
                  SizedBox(height: height * 0.04),
                  Image.asset(
                    AppAssets.sebhaHead,
                    width: width * 0.3,
                    fit: BoxFit.fill,
                  ),
                  SebhaWidget(azkar: ['سبحان الله', 'الحمد لله', 'الله أكبر']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
