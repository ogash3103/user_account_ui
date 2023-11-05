import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_account_ui/service/user.dart';

class PrefService {
  static Future<void> storeUser(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    final stringUser = jsonEncode(userModel.toJson());
    await prefs.setString('userModel', stringUser);
  }

  static Future<UserModel?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    // Check if the user is logged in.
    final isLoggedIn = prefs.containsKey('userModel');
    if (!isLoggedIn) return null;

    // Load the user data from shared preferences.
    final stringUser = prefs.getString('userModel');
    final map = jsonDecode(stringUser!);
    final userModel = UserModel.fromJson(map);

    return userModel;
  }

  static Future<bool> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('userModel');
  }

  static Future<void> saveLoginData(UserModel userModel) async {
    await storeUser(userModel);
  }
}

class UserModel {
  String? email;
  String? password;

  UserModel(this.email, this.password);

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
