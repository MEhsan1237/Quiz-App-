import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_dimensions.dart';
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';

class SettingsView extends GetView<ProfileController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Appearance',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _buildThemeOption(ThemeMode.system, 'System Default', Icons.settings_brightness),
                  _buildThemeOption(ThemeMode.light, 'Light Mode', Icons.light_mode),
                  _buildThemeOption(ThemeMode.dark, 'Dark Mode', Icons.dark_mode),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Information',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  const ListTile(
                    title: Text('App Version'),
                    trailing: Text('1.0.0'),
                  ),
                  ListTile(
                    title: const Text('Terms of Service'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed(AppRoutes.terms),
                  ),
                  ListTile(
                    title: const Text('Privacy Policy'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed(AppRoutes.privacy),
                  ),
                  ListTile(
                    title: const Text('Open Source Licenses'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => showLicensePage(
                      context: context,
                      applicationName: 'Quiz Pro',
                      applicationVersion: '1.0.0',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(ThemeMode mode, String title, IconData icon) {
    return Obx(() => RadioListTile<ThemeMode>(
          value: mode,
          groupValue: controller.themeMode.value,
          onChanged: (val) => controller.changeThemeMode(val!),
          title: Text(title),
          secondary: Icon(icon),
        ));
  }
}
