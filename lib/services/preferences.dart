import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();
  factory Preferences() => _instance;
  Preferences._internal();
  static Preferences get instance => _instance;

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool hasToShowSubtitles() {
    return prefs.getBool('showSubtitles') ?? false;
  }

  Future<void> setShowSubtitles(bool value) async {
    await prefs.setBool('showSubtitles', value);
  }

}
