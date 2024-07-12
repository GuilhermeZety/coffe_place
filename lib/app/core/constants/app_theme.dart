import 'package:coffee_place/app/core/constants/app_colors.dart';
import 'package:coffee_place/app/core/constants/app_fonts.dart';
import 'package:coffee_place/main.dart';
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
        // primarySwatch: AppColors.primary.toMaterialColor(),
        // primaryColor: AppColors.primary,
        fontFamily: AppFonts.defaultFont,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.brown_200,
            fontSize: 32,
            fontFamily: AppFonts.defaultFont,
            fontWeight: AppFonts.bold,
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.title,
          inactiveTrackColor: AppColors.title.withOpacity(0.3),
          // trackShape: const RoundedRectSliderTrackShape(),
          trackShape: CustomTrackShape(),
          trackHeight: 2.0,
          valueIndicatorColor: AppColors.primary,
          thumbColor: AppColors.primary,
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.brown_900,
      );

  static ThemeData get light => ThemeData(
        // primarySwatch: AppColors.primary.toMaterialColor(),
        // primaryColor: AppColors.primary,
        fontFamily: AppFonts.defaultFont,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.brown_700,
            fontSize: 32,
            fontFamily: AppFonts.defaultFont,
            fontWeight: AppFonts.bold,
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.title,
          inactiveTrackColor: AppColors.title.withOpacity(0.3),
          // trackShape: const RoundedRectSliderTrackShape(),
          trackShape: CustomTrackShape(),
          trackHeight: 2.0,
          valueIndicatorColor: AppColors.primary,
          thumbColor: AppColors.primary,
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.brown_100,
      );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
