import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

class PageViewItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.logo),
        SizedBox(height: height * 0.05),
        Expanded(
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: height * 0.44,
              ),
              SizedBox(height: height * 0.02),
              Text(title, style: AppTextStyle.bold24gold),
            ],
          ),
        ),
        Text(description,textAlign: TextAlign.center, style: AppTextStyle.bold24gold),
      ],
    );
  }
}
