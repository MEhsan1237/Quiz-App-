import 'package:get/get.dart';
import '../../../data/models/question_model.dart';
import '../../../data/repositories/quiz_repository.dart';
import '../../../routes/app_routes.dart';

class QuizController extends GetxController {
  final QuizRepository _repository = Get.find<QuizRepository>();

  final RxList<QuestionModel> questions = <QuestionModel>[].obs;
  final RxInt currentIndex = 0.obs;
  final RxInt correctAnswers = 0.obs;
  final RxString selectedAnswer = ''.obs;
  final RxBool isAnswered = false.obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  late Map<String, dynamic> category;
  late String difficulty;

  @override
  void onInit() {
    super.onInit();
    
    // Safely handle arguments with robust casting
    final dynamic args = Get.arguments;
    
    if (args != null && args is Map) {
      final categoryData = args['category'];
      if (categoryData != null && categoryData is Map) {
        category = Map<String, dynamic>.from(categoryData);
      } else {
        category = {'id': 0, 'name': 'Mixed'};
      }
      difficulty = args['difficulty']?.toString() ?? 'medium';
    } else {
      category = {'id': 0, 'name': 'Mixed'};
      difficulty = 'medium';
    }
    
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final results = await _repository.fetchQuestions(
        amount: 10,
        category: category['id'] == 0 ? null : category['id'],
        difficulty: difficulty,
      );
      questions.assignAll(results);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void selectAnswer(String answer) {
    if (isAnswered.value) return;
    selectedAnswer.value = answer;
    isAnswered.value = true;

    if (answer == questions[currentIndex.value].correctAnswer) {
      correctAnswers.value++;
    }
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedAnswer.value = '';
      isAnswered.value = false;
    } else {
      finishQuiz();
    }
  }

  void finishQuiz() {
    Get.offNamed(AppRoutes.result, arguments: {
      'category': category['name'],
      'difficulty': difficulty,
      'total': questions.length,
      'correct': correctAnswers.value,
    });
  }
}
