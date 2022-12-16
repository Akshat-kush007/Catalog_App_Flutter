import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
//
//
  Future<bool> setUserData({
    required String userName,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', userName);
      await prefs.setString('password', password);
    } catch (err) {
      print('SetUserData Error : ' + err.toString());
      return false;
    }
    return true;
  }

//
//
  Future<Map<String, String>> get getUserData async {
    final map = Map<String, String>();
    try {
      final prefs = await SharedPreferences.getInstance();
      map['userName'] = (await prefs.getString('username')) ?? "";
      map['password'] = await prefs.getString('password') ?? "";
      if (map['userName'] == "" || map['password'] == "")
        throw Exception('No Value in shared prefs Exception');
    } catch (err) {
      print('GetUserData Error : ' + err.toString());
      rethrow;
    }
    print(map['userName']);
    print(map['password']);
    return map;
  }
}
