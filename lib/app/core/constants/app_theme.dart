import 'package:coffe_place/app/core/constants/app_colors.dart';
import 'package:coffe_place/app/core/constants/app_fonts.dart';
import 'package:coffe_place/main.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  //SingleTon
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  factory AppTheme() => AppTheme._instance;
  //

  late Signal<ThemeMode> themeMode;
  void init() {
    var value = session.prefs.getBool('theme');

    if (value == null) {
      themeMode = ThemeMode.dark.toSignal();
      return;
    }
    if (value == true) {
      themeMode = ThemeMode.dark.toSignal();
      return;
    }
    themeMode = ThemeMode.light.toSignal();
  }

  Future invertThemeMode() async {
    themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await session.prefs.setBool('theme', themeMode.value == ThemeMode.dark);
  }

  static ThemeData get dark => ThemeData(
        fontFamily: AppFonts.defaultFont,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.brown_200,
            fontSize: 32,
            fontFamily: AppFonts.defaultFont,
            fontWeight: AppFonts.bold,
          ),
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.brown_900,
      );

  static ThemeData get light => ThemeData(
        fontFamily: AppFonts.defaultFont,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.brown_700,
            fontSize: 32,
            fontFamily: AppFonts.defaultFont,
            fontWeight: AppFonts.bold,
          ),
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.brown_100,
      );
}
