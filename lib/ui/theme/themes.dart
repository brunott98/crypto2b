import 'package:crypto2b/ui/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.black;
  static const Color accentColor1 = Color(0xffffbf00);
  static const Color accentColor2 = Color(0xffFFE28A);
  static const Color textColor = Colors.white;
  static const Color textShadowColor = Colors.black;
  static const Color barColor = Colors.black87;
}

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.accentColor1,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: AppConstants.appFont,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: AppConstants.appFont,
        ),
      ),
    );
  }
}
