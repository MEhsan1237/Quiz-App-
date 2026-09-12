import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_dimensions.dart';
import '../../controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../profile/controllers/profile_controller.dart';
import '../../../profile/widgets/language_bottom_sheet.dart';

class ProfileTab extends GetView<HomeController> {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutes.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          children: [
            _buildProfileHeader(context, profileController),
            const SizedBox(height: 32),
            _buildSection(context, 'Account', [
              _buildProfileTile(Icons.person_outline, 'Update Profile', () => Get.toNamed(AppRoutes.updateProfile)),
              _buildProfileTile(Icons.bar_chart, 'Quiz Statistics', () => Get.toNamed(AppRoutes.statistics)),
            ]),
            const SizedBox(height: 24),
            _buildSection(context, 'Appearance', [
              _buildProfileTile(Icons.dark_mode_outlined, 'Theme Mode', () => Get.toNamed(AppRoutes.settings)),
              Obx(() => _buildProfileTile(
                Icons.language, 
                'Language', 
                () => Get.bottomSheet(const LanguageBottomSheet()),
                trailingText: profileController.language.value,
              )),
            ]),
            const SizedBox(height: 24),
            _buildSection(context, 'App', [
              _buildProfileTile(Icons.notifications_none, 'Notifications', () {}),
              _buildProfileTile(Icons.share_outlined, 'Share App', () => profileController.shareApp()),
              _buildProfileTile(Icons.star_outline, 'Rate App', () {}),
            ]),
            const SizedBox(height: 24),
            _buildSection(context, 'Support', [
              _buildProfileTile(Icons.help_outline, 'Help & Support', () => Get.toNamed(AppRoutes.helpSupport)),
              _buildProfileTile(Icons.info_outline, 'About App', () => Get.toNamed(AppRoutes.about)),
            ]),
            const SizedBox(height: 24),
            _buildSection(context, 'Account Actions', [
              _buildProfileTile(Icons.logout, 'Logout', () => profileController.logout(), color: AppColors.error),
            ]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, ProfileController profileController) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusExtraLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Obx(() => Text(
            profileController.name.value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
          const SizedBox(height: 4),
          Obx(() => Text(
            profileController.role.value,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          )),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile(IconData icon, String title, VoidCallback onTap, {Color? color, String? trailingText}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.primary),
      title: Text(title, style: TextStyle(color: color)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }
}
