import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/widgets/stat_card.dart';

class StatisticsView extends GetView<HomeController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Statistics'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverview(context),
            const SizedBox(height: 24),
            Text(
              'Detailed Performance',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDetailedStats(),
            const SizedBox(height: 24),
            _buildAchievementSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOverview(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusExtraLarge),
      ),
      child: Column(
        children: [
          Obx(() => Text(
            '${controller.avgAccuracy.value.toStringAsFixed(1)}%',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
          const Text(
            'Average Accuracy',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSimpleStat('Quizzes', controller.totalQuizzes.value.toString()),
              _buildSimpleStat('Correct', controller.totalCorrect.value.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDetailedStats() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: [
        StatCard(
          title: 'Best Score',
          value: '100%',
          icon: Icons.emoji_events,
          color: Colors.amber,
        ),
        StatCard(
          title: 'Questions',
          value: (controller.totalQuizzes.value * 10).toString(),
          icon: Icons.quiz,
          color: Colors.blue,
        ),
        StatCard(
          title: 'Streaks',
          value: '5 Days',
          icon: Icons.bolt,
          color: Colors.orange,
        ),
        StatCard(
          title: 'Rank',
          value: 'Pro',
          icon: Icons.trending_up,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildAchievementSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildAchievementTile(Icons.workspace_premium, 'First Quiz', 'Completed your first quiz challenge', true),
              _buildAchievementTile(Icons.auto_awesome, 'Perfect Score', 'Got all answers correct in a quiz', false),
              _buildAchievementTile(Icons.groups, 'Community Member', 'Joined the Quiz Pro community', true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementTile(IconData icon, String title, String desc, bool unlocked) {
    return ListTile(
      leading: Icon(icon, color: unlocked ? Colors.amber : Colors.grey),
      title: Text(title),
      subtitle: Text(desc),
      trailing: Icon(
        unlocked ? Icons.check_circle : Icons.lock,
        color: unlocked ? Colors.green : Colors.grey,
      ),
    );
  }
}
