import 'package:coffee_place/app/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color get primary => AppTheme().themeMode.value == ThemeMode.dark ? AppColors.gold_500 : AppColors.gold_600;
  static Color get secundary => AppTheme().themeMode.value == ThemeMode.dark ? AppColors.green_300 : AppColors.green_500;
  static Color get background => AppTheme().themeMode.value == ThemeMode.dark ? AppColors.brown_900 : AppColors.brown_100;
  static Color get title => AppTheme().themeMode.value == ThemeMode.dark ? AppColors.brown_200 : AppColors.brown_700;
  static Color get subtitle => AppTheme().themeMode.value == ThemeMode.dark ? AppColors.brown_300 : AppColors.brown_400;
  static Color get button => AppTheme().themeMode.value == ThemeMode.dark ? AppColors.brown_600 : AppColors.brown_750;

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey_50 = Color(0xFFF0F0F7);
  static const Color grey_100 = Color(0xFFE6E6F0);
  static const Color grey_200 = Color(0xFFDADADD);
  static const Color grey_300 = Color(0xFFBABBBF);
  static const Color grey_400 = Color(0xFF94959C);
  static const Color grey_500 = Color(0xFF767681);
  static const Color grey_600 = Color(0xFF606169);
  static const Color grey_700 = Color(0xFF4E4E56);
  static const Color grey_800 = Color(0xFF434349);
  static const Color grey_900 = Color(0xFF3B3C3F);
  static const Color grey_950 = Color(0xFF27272A);

  static const Color black = Color(0xFF101010);

  static const Color brown_100 = Color(0xFFFAF3E0); //light background
  static const Color brown_900 = Color(0xFF1F1B16); //dark background

  static const Color brown_200 = Color(0xFFEDE1CF); //dark Title
  static const Color brown_700 = Color(0xFF4A3A2B); //light title

  static const Color brown_300 = Color(0xFFA29785); //light subtitle
  static const Color brown_400 = Color(0xFF867E72); //dark subtitle

  static const Color brown_600 = Color(0xFF8B5E34); //light button
  static const Color brown_750 = Color(0xFF4E342E); //dark button

  static const Color gold_500 = Color(0xFFD4A259); //dark primary
  static const Color gold_600 = Color(0xFFC0A16B); //light primary

  static const Color green_300 = Color(0xFFA3B18A); //dark secundary
  static const Color green_500 = Color(0xFF35524A); //light secundary
}
