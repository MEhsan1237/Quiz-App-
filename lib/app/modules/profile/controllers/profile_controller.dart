import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../services/storage_service.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString role = ''.obs;
  final RxString language = ''.obs;

  @override
  void onInit() {
    super.onInit();
    themeMode.value = _storageService.themeMode;
    name.value = _storageService.userName;
    email.value = _storageService.userEmail;
    role.value = _storageService.userRole;
    language.value = _storageService.language;
  }

  void changeThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    _storageService.saveThemeMode(mode);
  }

  void changeLanguage(String lang) {
    language.value = lang;
    _storageService.saveLanguage(lang);
    // In a real app with localization, you'd call Get.updateLocale here
  }

  Future<void> updateProfile(String newName, String newEmail, String newRole) async {
    await _storageService.saveProfile(newName, newEmail, newRole);
    name.value = newName;
    email.value = newEmail;
    role.value = newRole;
  }

  void shareApp() {
    Share.share(
      'Check out this amazing Quiz App! Test your knowledge across different categories and challenge yourself. \n\nDownload now: https://example.com/quizapp',
    );
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Clear session data if any
              Get.offAllNamed(AppRoutes.splash);
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
