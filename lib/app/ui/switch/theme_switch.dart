import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:coffee_place/app/core/constants/app_colors.dart';
import 'package:coffee_place/app/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key, this.size = 30});

  final double size;

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    themeMode = AppTheme().themeMode.value;
    effect(() {
      var value = AppTheme().themeMode.value;
      if (value != themeMode) {
        changeTheme(value);
      }
    });
    super.initState();
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher.switcher(
      builder: (context, switcher) => GestureDetector(
        onTap: () async {
          switcher.changeTheme(
            theme: AppTheme().themeMode.value == ThemeMode.dark ? AppTheme.light : AppTheme.dark,
          );
          await AppTheme().invertThemeMode();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secundary,
          ),
          child: Icon(
            themeMode == ThemeMode.light ? Icons.sunny : Icons.dark_mode,
            color: AppColors.white,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }
}
