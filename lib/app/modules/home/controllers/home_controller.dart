import 'package:get/get.dart';
import '../../../services/storage_service.dart';
import '../../../data/models/quiz_history_model.dart';

class HomeController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  
  final RxInt currentIndex = 0.obs;
  final RxString userName = ''.obs;
  final RxList<QuizHistoryModel> recentHistory = <QuizHistoryModel>[].obs;
  
  final RxInt totalQuizzes = 0.obs;
  final RxInt totalCorrect = 0.obs;
  final RxDouble avgAccuracy = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    userName.value = _storageService.userName;
    final history = _storageService.quizHistory;
    final decodedHistory = history.map((e) => QuizHistoryModel.fromRawJson(e)).toList();
    
    recentHistory.assignAll(decodedHistory.take(5).toList());
    
    totalQuizzes.value = decodedHistory.length;
    if (totalQuizzes.value > 0) {
      int correct = 0;
      double accuracySum = 0;
      for (var item in decodedHistory) {
        correct += item.correctAnswers;
        accuracySum += item.accuracy;
      }
      totalCorrect.value = correct;
      avgAccuracy.value = accuracySum / totalQuizzes.value;
    }
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
