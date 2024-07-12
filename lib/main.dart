import 'package:coffee_place/app/app_widget.dart';
import 'package:coffee_place/app/core/current_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

CurrentSession session = CurrentSession();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await session.init();
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  runApp(
    const AppWidget(),
  );
}
