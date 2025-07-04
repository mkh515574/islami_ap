import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_theme.dart';
import 'package:islamic_app/core/services/shared_prefs.dart';
import 'package:islamic_app/features/Home/view/home_screen.dart';
import 'package:islamic_app/features/home/Quran/controller/most_recent_provider.dart';
import 'package:islamic_app/features/home/Quran/widgets/quran_screen_details/sura_details_screen.dart';
import 'package:islamic_app/features/onBoarding/view/on_boarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnBoarding =
      prefs.getBool(SharedPrefsKeys.onBoardingCompleted) ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child:  MyApp(showOnBoarding: !hasSeenOnBoarding),
    ),
  );
}

class MyApp extends StatelessWidget {

  final bool showOnBoarding;

  const MyApp({super.key, required this.showOnBoarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: showOnBoarding ? OnBoardingScreen.routeName : HomeScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
    );
  }
}
