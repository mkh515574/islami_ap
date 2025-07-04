import 'package:flutter/material.dart';
import 'package:islamic_app/features/home/Hadith/widgets/carousel_slider_view.dart';

import '../../../core/constants/app_assets.dart';



class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.logo),
            CarouselSliderView()
          ],
        ),
      ),
    );
  }
}
