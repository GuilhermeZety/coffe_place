import 'dart:convert';
import 'dart:developer';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:coffe_place/app/core/constants/app_colors.dart';
import 'package:coffe_place/app/core/constants/app_theme.dart';
import 'package:coffe_place/app/core/extensions/widget_extension.dart';
import 'package:coffe_place/app/core/location_session.dart';
import 'package:coffe_place/app/core/utils/toasting.dart';
import 'package:coffe_place/app/ui/switch/theme_switch.dart';
import 'package:coffe_place/main.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    LocalizatiionSession().locale.listen(context, () {
      if (mounted) setState(() {});
    });

    AppTheme().themeMode.listen(context, () {
      log(AppTheme().themeMode.value.toString());
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppTheme().themeMode.value == ThemeMode.dark ? 'assets/texture_dark.png' : 'assets/texture_light.png'),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Image.asset(
                  AppTheme().themeMode.value == ThemeMode.dark ? 'assets/objects_dark.png' : 'assets/objects_light.png',
                  width: 500,
                ),
              ),
            ),
            AppBar(
              actions: [
                const ThemeSwitch(),
                const Gap(8),
                configButton(),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ).pRight(30),
            Text(
              'Coffe Place',
              style: Theme.of(context).textTheme.titleLarge,
            ).pLeft(40).pTop(40),
          ],
        ),
      ),
    );
    var configString = session.prefs.getString('config');
    log(configString ?? '');
    if (configString == null) {
      return ThemeSwitchingArea(
        child: scaffold,
      );
    }
    var config = jsonDecode(configString) as Map<String, dynamic>;
    if (config['animation_theme_switch'] == false) {
      return scaffold;
    }
    return ThemeSwitchingArea(
      child: scaffold,
    );
  }

  Widget configButton() {
    return GestureDetector(
      onTap: () async {
        var configString = session.prefs.getString('config');
        if (configString == null) {
          await session.prefs.setString('config', jsonEncode({'animation_theme_switch': false}));
          Toasting.success(context, title: 'animation_theme_switch', description: 'false');
          return;
        }
        log(configString);
        var config = jsonDecode(configString) as Map<String, dynamic>;

        await session.prefs.setString(
          'config',
          jsonEncode({
            'animation_theme_switch': !config['animation_theme_switch'],
          }),
        );
        Toasting.success(context, title: 'animation_theme_switch', description: (!config['animation_theme_switch']).toString());
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secundary,
        ),
        child: const Icon(
          Icons.settings_rounded,
          color: AppColors.white,
        ),
      ),
    );
  }
}
