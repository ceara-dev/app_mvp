import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<void> addUser(String key, Map<String, String> user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user);
    await prefs.setString(key, userJson);
  }

  Future<Map<String, String>?> getUser(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(key);
    if (userJson != null) {
      return Map<String, String>.from(
          jsonDecode(userJson)); // Convert JSON string back to map
    }
    return null;
  }

  Future<void> deleteUser(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
