import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../controllers/profile_controller.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final languages = [
      'English',
      'Urdu',
      'Arabic',
      'Spanish',
      'French',
      'German',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppDimensions.radiusExtraLarge)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Select Language',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final lang = languages[index];
                return Obx(() => ListTile(
                  leading: Icon(
                    Icons.language,
                    color: controller.language.value == lang ? AppColors.primary : Colors.grey,
                  ),
                  title: Text(
                    lang,
                    style: TextStyle(
                      fontWeight: controller.language.value == lang ? FontWeight.bold : FontWeight.normal,
                      color: controller.language.value == lang ? AppColors.primary : null,
                    ),
                  ),
                  trailing: controller.language.value == lang
                      ? const Icon(Icons.check_circle, color: AppColors.primary)
                      : null,
                  onTap: () {
                    controller.changeLanguage(lang);
                    Get.back();
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
