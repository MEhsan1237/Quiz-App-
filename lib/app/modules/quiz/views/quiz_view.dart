import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../controllers/quiz_controller.dart';

import 'package:flutter/services.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.category['name']),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Obx(() => Text(
                '${controller.currentIndex.value + 1}/${controller.questions.length}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitPulse(color: AppColors.primary, size: 80),
                SizedBox(height: 20),
                Text('Preparing your questions...'),
              ],
            ),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 60, color: AppColors.error),
                const SizedBox(height: 16),
                Text(controller.errorMessage.value, textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.fetchQuestions,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final question = controller.questions[controller.currentIndex.value];

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressBar(),
              const SizedBox(height: 32),
              Text(
                question.question,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ...question.allAnswers.map((answer) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildOption(answer),
              )),
              const SizedBox(height: 20),
              if (controller.isAnswered.value)
                ElevatedButton(
                  onPressed: controller.nextQuestion,
                  child: Text(controller.currentIndex.value == controller.questions.length - 1
                      ? 'Show Results'
                      : 'Next Question'),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: (controller.currentIndex.value + 1) / controller.questions.length,
            minHeight: 8,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String answer) {
    return Obx(() {
      Color bgColor = Colors.transparent;
      Color borderColor = Colors.grey.withOpacity(0.3);
      IconData? icon;

      if (controller.isAnswered.value) {
        if (answer == controller.questions[controller.currentIndex.value].correctAnswer) {
          bgColor = AppColors.success.withOpacity(0.1);
          borderColor = AppColors.success;
          icon = Icons.check_circle;
        } else if (answer == controller.selectedAnswer.value) {
          bgColor = AppColors.error.withOpacity(0.1);
          borderColor = AppColors.error;
          icon = Icons.cancel;
        }
      } else if (answer == controller.selectedAnswer.value) {
        borderColor = AppColors.primary;
      }

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            controller.selectAnswer(answer);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    answer,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: controller.selectedAnswer.value == answer ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                if (icon != null) Icon(icon, color: borderColor),
              ],
            ),
          ),
        ),
      );
    });
  }
}
