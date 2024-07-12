import 'package:coffee_place/app/core/constants/app_theme.dart';
import 'package:coffee_place/app/core/location_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentSession {
  late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    LocalizatiionSession().init();
    AppTheme().init();
  }
}
