import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../../../routes/app_routes.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.paddingLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScoreCircle(context),
                const SizedBox(height: 40),
                Text(
                  controller.performanceMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                _buildStatsCard(context),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.home),
                  child: const Text('Back to Home'),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => Get.offNamed(AppRoutes.category),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Try Another Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCircle(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: controller.accuracy / 100,
            strokeWidth: 15,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        Column(
          children: [
            Text(
              '${controller.accuracy.toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
            ),
            const Text('Accuracy'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(context, 'Total', controller.total.toString()),
              const VerticalDivider(),
              _buildStatItem(context, 'Correct', controller.correct.toString()),
              const VerticalDivider(),
              _buildStatItem(context, 'Wrong', (controller.total - controller.correct).toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
