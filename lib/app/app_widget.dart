import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:coffee_place/app/core/constants/app_theme.dart';
import 'package:coffee_place/app/core/location_session.dart';
import 'package:coffee_place/app/modules/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:signals/signals_flutter.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with SignalsAutoDisposeMixin {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/translations'];

    return ThemeProvider(
      initTheme: AppTheme().themeMode.value == ThemeMode.dark ? AppTheme.dark : AppTheme.light,
      builder: (context, myTheme) {
        return MaterialApp(
          title: 'Coffe Place',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
          supportedLocales: LocalizatiionSession().suportedLocales.map((e) => Locale(e.$1, e.$2)),
          locale: LocalizatiionSession().locale.watch(context),
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        );
      },
    );
  }
}
