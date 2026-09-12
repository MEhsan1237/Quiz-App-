import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_dimensions.dart';
import '../../controllers/home_controller.dart';

class HistoryTab extends GetView<HomeController> {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz History'),
        centerTitle: true,
      ),
      body: Obx(() {
        final history = controller.recentHistory; // In a real app, might want all history here
        if (history.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppDimensions.paddingMedium),
          itemCount: history.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = history[index];
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  item.category,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('${item.difficulty} • ${DateFormat('dd MMM yyyy, hh:mm a').format(item.date)}'),
                    const SizedBox(height: 4),
                    Text('${item.correctAnswers}/${item.totalQuestions} Questions Correct'),
                  ],
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${item.accuracy.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 80, color: Colors.grey.withOpacity(0.5)),
          const SizedBox(height: 16),
          const Text(
            'No quiz history yet.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Take your first quiz and start building your stats!'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => controller.changeTab(1),
            style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
