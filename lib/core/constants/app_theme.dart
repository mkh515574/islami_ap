import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackBg,

    primaryColor: AppColors.gold,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(color: AppColors.gold),



      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,

      backgroundColor: AppColors.gold
    )


  );


}