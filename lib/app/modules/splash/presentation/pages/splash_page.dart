// ignore_for_file: use_build_context_synchronously

import 'package:coffee_place/app/core/constants/app_assets.dart';
import 'package:coffee_place/app/core/constants/app_colors.dart';
import 'package:coffee_place/app/core/extensions/widget_extension.dart';
import 'package:coffee_place/app/core/transitions/fade_transition.dart';
import 'package:coffee_place/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    await AppAssets.bytes.init();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushAndRemoveUntil(FadePageRoute(const HomePage()), (Route<dynamic> route) => false);
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.images.texture),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            child: Text(
              'Coffee Place',
              style: TextStyle(
                color: AppColors.title,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ).hero('logo'),
        ),
      ),
    );
  }
}
