import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/values/app_constants.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // Theme
  ThemeMode get themeMode {
    final mode = _prefs.getString(AppConstants.keyThemeMode);
    if (mode == 'light') return ThemeMode.light;
    if (mode == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    await _prefs.setString(AppConstants.keyThemeMode, mode.name);
  }

  // User Profile
  String get userName => _prefs.getString(AppConstants.keyUserName) ?? 'User';
  String get userEmail => _prefs.getString(AppConstants.keyUserEmail) ?? 'user@example.com';
  String get userRole => _prefs.getString(AppConstants.keyUserRole) ?? 'Quiz Enthusiast';

  Future<void> saveProfile(String name, String email, String role) async {
    await _prefs.setString(AppConstants.keyUserName, name);
    await _prefs.setString(AppConstants.keyUserEmail, email);
    await _prefs.setString(AppConstants.keyUserRole, role);
  }

  // Language
  String get language => _prefs.getString(AppConstants.keyLanguage) ?? 'English';
  Future<void> saveLanguage(String lang) async {
    await _prefs.setString(AppConstants.keyLanguage, lang);
  }

  // Quiz History
  List<String> get quizHistory => _prefs.getStringList(AppConstants.keyUserHistory) ?? [];

  Future<void> saveQuizResult(String resultJson) async {
    final history = quizHistory;
    history.insert(0, resultJson);
    // Keep last 50 records
    if (history.length > 50) history.removeLast();
    await _prefs.setStringList(AppConstants.keyUserHistory, history);
  }
}
