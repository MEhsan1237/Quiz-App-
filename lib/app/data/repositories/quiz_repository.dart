import '../../services/api_service.dart';
import '../models/question_model.dart';

class QuizRepository {
  final ApiService _apiService;

  QuizRepository(this._apiService);

  Future<List<QuestionModel>> fetchQuestions({
    required int amount,
    int? category,
    String? difficulty,
  }) async {
    final response = await _apiService.getQuestions(
      amount: amount,
      category: category,
      difficulty: difficulty,
    );

    if (response['response_code'] == 0) {
      final List results = response['results'];
      return results.map((e) => QuestionModel.fromJson(e)).toList();
    } else {
      throw _handleResponseCode(response['response_code']);
    }
  }

  String _handleResponseCode(int code) {
    switch (code) {
      case 1:
        return 'No results found for these parameters.';
      case 2:
        return 'Invalid parameters.';
      case 3:
        return 'Token not found.';
      case 4:
        return 'Token exhausted. Resetting session.';
      default:
        return 'An unexpected error occurred.';
    }
  }
}
