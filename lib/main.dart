import 'package:coffe_place/app/app_widget.dart';
import 'package:coffe_place/app/core/current_session.dart';
import 'package:flutter/material.dart';

CurrentSession session = CurrentSession();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await session.init();
  runApp(
    const AppWidget(),
  );
}
