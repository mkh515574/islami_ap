import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../Quran/quran_screen.dart';
import '../Radio/radio_screen.dart';
import '../Sebha/sebha_screen.dart';
import '../Time/time_screen.dart';
import '../hadith/hadith_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          this.index = index;
          setState(() {});
        },

        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.quranLogo)),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.hadithLogo)),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.sebhaLogo)),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.radioLogo)),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.timeLogo)),
            label: "Time",
          ),
        ],
      ),
    );
  }
}
