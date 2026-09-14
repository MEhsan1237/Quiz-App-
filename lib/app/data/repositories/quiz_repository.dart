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
    try {
      final response = await _apiService.getQuestions(
        amount: amount,
        category: category,
        difficulty: difficulty,
      );

      final responseCode = response['response_code'];

      if (responseCode == 0) {
        final List results = response['results'] ?? [];
        if (results.isNotEmpty) {
          return results.map((e) => QuestionModel.fromJson(e)).toList();
        }
      }

      // If response code is 1 (No results for exact difficulty), try without difficulty
      if (responseCode == 1 && difficulty != null) {
        final fallbackResponse = await _apiService.getQuestions(
          amount: amount,
          category: category,
          difficulty: null,
        );
        if (fallbackResponse['response_code'] == 0) {
          final List results = fallbackResponse['results'] ?? [];
          if (results.isNotEmpty) {
            return results.map((e) => QuestionModel.fromJson(e)).toList();
          }
        }
      }

      // If API returns no results or rate limit code, return category fallback questions
      return _getFallbackQuestions(category: category, difficulty: difficulty ?? 'medium');
    } catch (_) {
      // If network fails completely (e.g. device offline), return reliable fallback questions
      return _getFallbackQuestions(category: category, difficulty: difficulty ?? 'medium');
    }
  }

  List<QuestionModel> _getFallbackQuestions({int? category, required String difficulty}) {
    final List<Map<String, dynamic>> rawData = _getRawFallbackData(category);
    return rawData.map((e) => QuestionModel.fromJson(e)).toList();
  }

  List<Map<String, dynamic>> _getRawFallbackData(int? category) {
    switch (category) {
      case 9: // General Knowledge
        return [
          {
            'category': 'General Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Which planet is known as the Red Planet?',
            'correct_answer': 'Mars',
            'incorrect_answers': ['Venus', 'Jupiter', 'Saturn']
          },
          {
            'category': 'General Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What is the capital city of France?',
            'correct_answer': 'Paris',
            'incorrect_answers': ['London', 'Berlin', 'Madrid']
          },
          {
            'category': 'General Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'How many continents are there on Earth?',
            'correct_answer': '7',
            'incorrect_answers': ['5', '6', '8']
          },
          {
            'category': 'General Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What is the largest ocean on Earth?',
            'correct_answer': 'Pacific Ocean',
            'incorrect_answers': ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean']
          },
          {
            'category': 'General Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Which chemical element has the symbol O?',
            'correct_answer': 'Oxygen',
            'incorrect_answers': ['Gold', 'Osmium', 'Zinc']
          },
        ];
      case 17: // Science
        return [
          {
            'category': 'Science & Nature',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What chemical element has the symbol Au?',
            'correct_answer': 'Gold',
            'incorrect_answers': ['Silver', 'Copper', 'Aluminum']
          },
          {
            'category': 'Science & Nature',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What power source do solar panels convert into electricity?',
            'correct_answer': 'Sunlight',
            'incorrect_answers': ['Wind', 'Water', 'Thermal']
          },
          {
            'category': 'Science & Nature',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What is the hardest natural substance on Earth?',
            'correct_answer': 'Diamond',
            'incorrect_answers': ['Titanium', 'Iron', 'Quartz']
          },
          {
            'category': 'Science & Nature',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Which organ pumps blood throughout the human body?',
            'correct_answer': 'Heart',
            'incorrect_answers': ['Brain', 'Lungs', 'Liver']
          },
          {
            'category': 'Science & Nature',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What gas do plants absorb from the atmosphere?',
            'correct_answer': 'Carbon Dioxide',
            'incorrect_answers': ['Oxygen', 'Nitrogen', 'Helium']
          },
        ];
      case 18: // Technology
        return [
          {
            'category': 'Science: Computers',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What does CPU stand for in computer science?',
            'correct_answer': 'Central Processing Unit',
            'incorrect_answers': [
              'Computer Personal Unit',
              'Central Power Unit',
              'Control Process Unit'
            ]
          },
          {
            'category': 'Science: Computers',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Which operating system is developed by Google?',
            'correct_answer': 'Android',
            'incorrect_answers': ['iOS', 'Windows', 'Linux']
          },
          {
            'category': 'Science: Computers',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What programming language is used by Flutter?',
            'correct_answer': 'Dart',
            'incorrect_answers': ['Java', 'Swift', 'Python']
          },
          {
            'category': 'Science: Computers',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What does RAM stand for?',
            'correct_answer': 'Random Access Memory',
            'incorrect_answers': [
              'Read Access Memory',
              'Run Application Memory',
              'Rapid Action Module'
            ]
          },
          {
            'category': 'Science: Computers',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What symbol is used for unique identifiers in web URLs?',
            'correct_answer': '#',
            'incorrect_answers': ['@', r'$', '&']
          },
        ];
      case 21: // Sports
        return [
          {
            'category': 'Sports',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'How many players are on the field for one team in soccer?',
            'correct_answer': '11',
            'incorrect_answers': ['9', '10', '12']
          },
          {
            'category': 'Sports',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Which country hosted the 2016 Summer Olympics?',
            'correct_answer': 'Brazil',
            'incorrect_answers': ['China', 'UK', 'Japan']
          },
          {
            'category': 'Sports',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'In basketball, how many points is a shot from behind the arc worth?',
            'correct_answer': '3',
            'incorrect_answers': ['1', '2', '4']
          },
          {
            'category': 'Sports',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Grand Slam tournaments are associated with which sport?',
            'correct_answer': 'Tennis',
            'incorrect_answers': ['Golf', 'Cricket', 'Polo']
          },
          {
            'category': 'Sports',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What is the maximum score possible in a single game of bowling?',
            'correct_answer': '300',
            'incorrect_answers': ['200', '250', '350']
          },
        ];
      default: // Mixed / Default
        return [
          {
            'category': 'Mixed Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'Which planet is known as the Red Planet?',
            'correct_answer': 'Mars',
            'incorrect_answers': ['Venus', 'Jupiter', 'Saturn']
          },
          {
            'category': 'Mixed Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What does CPU stand for?',
            'correct_answer': 'Central Processing Unit',
            'incorrect_answers': [
              'Central Process Unit',
              'Computer Power Unit',
              'Control Processing Unit'
            ]
          },
          {
            'category': 'Mixed Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What chemical element has the symbol Au?',
            'correct_answer': 'Gold',
            'incorrect_answers': ['Silver', 'Copper', 'Iron']
          },
          {
            'category': 'Mixed Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'How many continents are on Earth?',
            'correct_answer': '7',
            'incorrect_answers': ['5', '6', '8']
          },
          {
            'category': 'Mixed Knowledge',
            'type': 'multiple',
            'difficulty': 'medium',
            'question': 'What language is used to build Flutter apps?',
            'correct_answer': 'Dart',
            'incorrect_answers': ['Kotlin', 'Swift', 'C++']
          },
        ];
    }
  }
}
