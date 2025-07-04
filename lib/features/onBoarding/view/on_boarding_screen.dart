import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_colors.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';
import 'package:islamic_app/core/services/shared_prefs.dart';
import 'package:islamic_app/features/Home/view/home_screen.dart';

import 'package:islamic_app/features/onBoarding/view/widgets/page_view_item.dart';


class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoarding";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: [
                    PageViewItem(
                      imagePath: AppAssets.onBoarding1,
                      title: "Welcome To Islami App",
                      description: "",
                    ),
                    PageViewItem(
                      imagePath: AppAssets.onBoarding2,
                      title: "Welcome To Islami",
                      description:
                          "We Are Very Excited To Have You In Our Community",
                    ),
                    PageViewItem(
                      imagePath: AppAssets.onBoarding3,
                      title: "Reading the Quran",
                      description: "Read, and your Lord is the Most Generous",
                    ),
                    PageViewItem(
                      imagePath: AppAssets.onBoarding4,
                      title: "Bearish",
                      description:
                          "Praise the name of your Lord, the Most High",
                    ),
                    PageViewItem(
                      imagePath: AppAssets.onBoarding5,
                      title: "Holy Quran Radio",
                      description:
                          "You can listen to the Holy Quran Radio through the application for free and easily",
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: currentIndex > 0
                        ? () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    child: Text(
                      currentIndex == 0 ? "" : "Back",
                      style: AppTextStyle.bold20gold.copyWith(fontSize: 16),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: 5,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      size: Size.square(width * 0.03),
                      activeSize: Size(width * 0.07, width * 0.03),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeColor: AppColors.gold,
                      color: AppColors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                            if (currentIndex == 4) {
                              await completeOnBoarding();
                              Navigator.pushReplacementNamed(
                                context,
                                HomeScreen.routeName,
                              );
                            } else {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                    child: Text(
                      (currentIndex == 4) ? "Finish" : "Next",
                      style: AppTextStyle.bold20gold.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
