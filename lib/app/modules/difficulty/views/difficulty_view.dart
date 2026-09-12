import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_dimensions.dart';
import '../../../routes/app_routes.dart';

class DifficultyView extends StatelessWidget {
  const DifficultyView({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    Map<String, dynamic> category;
    
    if (args != null && args is Map) {
      category = Map<String, dynamic>.from(args);
    } else {
      category = {'id': 0, 'name': 'Mixed'};
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category['name']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Difficulty',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Choose how challenging you want the quiz to be.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            _buildDifficultyCard(
              context,
              'Easy',
              'Perfect for a casual challenge',
              Icons.sentiment_satisfied_alt,
              Colors.green,
              category,
            ),
            const SizedBox(height: 16),
            _buildDifficultyCard(
              context,
              'Medium',
              'Balanced and engaging',
              Icons.sentiment_neutral,
              Colors.orange,
              category,
            ),
            const SizedBox(height: 16),
            _buildDifficultyCard(
              context,
              'Hard',
              'For true experts only',
              Icons.sentiment_very_dissatisfied,
              Colors.red,
              category,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyCard(
    BuildContext context,
    String level,
    String desc,
    IconData icon,
    Color color,
    Map<String, dynamic> category,
  ) {
    return Card(
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.quiz, arguments: {
          'category': category,
          'difficulty': level,
        }),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      desc,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
