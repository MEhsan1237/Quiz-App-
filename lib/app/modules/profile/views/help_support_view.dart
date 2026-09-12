import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../../../routes/app_routes.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchField(),
            const SizedBox(height: 32),
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildFAQList(),
            const SizedBox(height: 32),
            Text(
              'Still need help?',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSupportActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search help topics...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        filled: true,
      ),
    );
  }

  Widget _buildFAQList() {
    final faqs = [
      {
        'q': 'How do I start a quiz?',
        'a': 'Go to the Quiz tab, select a category and difficulty level, then tap Start Now.'
      },
      {
        'q': 'How is my score calculated?',
        'a': 'Each correct answer gives you 10 points. Your accuracy is the percentage of correct answers out of total questions.'
      },
      {
        'q': 'How do I change the theme?',
        'a': 'Go to Profile > Settings > Appearance and choose between Light, Dark, or System Default.'
      },
      {
        'q': 'Can I play offline?',
        'a': 'No, an internet connection is required to fetch new questions from the Open Trivia DB.'
      },
    ];

    return Column(
      children: faqs.map((faq) => ExpansionTile(
        title: Text(faq['q']!, style: const TextStyle(fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(faq['a']!),
          ),
        ],
      )).toList(),
    );
  }

  Widget _buildSupportActions() {
    return Column(
      children: [
        _buildActionTile(Icons.email_outlined, 'Contact Support', 'Get help via email', () {}),
        _buildActionTile(Icons.bug_report_outlined, 'Report a Problem', 'Tell us about an app issue', () => Get.toNamed(AppRoutes.reportProblem)),
        _buildActionTile(Icons.chat_bubble_outline, 'Troubleshooting', 'Common fixes for app issues', () {}),
      ],
    );
  }

  Widget _buildActionTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
