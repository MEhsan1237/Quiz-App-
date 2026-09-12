import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/quiz_history_model.dart';
import '../../../services/storage_service.dart';

class ResultController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  late dynamic category; // Can be Map or String
  late String difficulty;
  late int total;
  late int correct;
  late int score;
  late double accuracy;

  @override
  void onInit() {
    super.onInit();
    final dynamic args = Get.arguments;
    
    if (args != null && args is Map) {
      category = args['category'] ?? 'General';
      difficulty = args['difficulty']?.toString() ?? 'Medium';
      total = args['total'] ?? 0;
      correct = args['correct'] ?? 0;
    } else {
      category = 'General';
      difficulty = 'Medium';
      total = 0;
      correct = 0;
    }
    
    score = correct * 10;
    accuracy = total > 0 ? (correct / total) * 100 : 0;
    
    if (total > 0) {
      _saveResult();
    }
  }

  void _saveResult() {
    final categoryName = category is Map ? category['name'] : category.toString();
    
    final history = QuizHistoryModel(
      id: const Uuid().v4(),
      category: categoryName,
      difficulty: difficulty,
      totalQuestions: total,
      correctAnswers: correct,
      score: score,
      accuracy: accuracy,
      date: DateTime.now(),
    );
    _storageService.saveQuizResult(history.toRawJson());
  }

  String get performanceMessage {
    if (accuracy >= 90) return 'Excellent! Outstanding performance.';
    if (accuracy >= 70) return 'Good Job! You performed well.';
    if (accuracy >= 50) return 'Nice effort! Keep practicing.';
    return 'Keep Practicing! You can improve your score.';
  }
}
