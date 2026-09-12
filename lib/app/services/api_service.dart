import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/values/app_constants.dart';

class ApiService {
  Future<Map<String, dynamic>> getQuestions({
    required int amount,
    int? category,
    String? difficulty,
  }) async {
    final queryParams = {
      'amount': amount.toString(),
      'type': 'multiple',
    };

    if (category != null && category > 0) {
      queryParams['category'] = category.toString();
    }
    if (difficulty != null && difficulty.toLowerCase() != 'any') {
      queryParams['difficulty'] = difficulty.toLowerCase();
    }

    final uri = Uri.parse(AppConstants.baseUrl).replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
