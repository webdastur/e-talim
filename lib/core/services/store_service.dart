import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreService {
  static StoreService get to => Modular.get<StoreService>();

  late final SharedPreferences prefs;

  static Future<StoreService> init() async {
    var instance = StoreService();
    var prefs = await SharedPreferences.getInstance();

    instance.prefs = prefs;

    return instance;
  }

  bool get isLoggedIn => prefs.getBool('is_logged_in') ?? false;

  void setLoggedIn(bool value) => prefs.setBool('is_logged_in', value);

  String? get token => prefs.getString('token');

  void setToken(String value) => prefs.setString('token', value);
}
