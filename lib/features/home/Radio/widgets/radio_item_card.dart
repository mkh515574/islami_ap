import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

class RadioItemCard extends StatelessWidget {
  const RadioItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.046),
      width: width,
      height: height * 0.151,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(width*0.05),
        image: DecorationImage(
          image: AssetImage(AppAssets.mosqueBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Radio Ibrahim Al-Akdar",style: AppTextStyle.bold24Black),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow,size: width*0.12),
              SizedBox(
                width: width * 0.05,
              ),
              Icon(Icons.volume_up,size: width*0.12,)
            ],
          )
        ],
      ),
    );
  }
}
