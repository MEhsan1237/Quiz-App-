import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';
import '../../../data/repositories/quiz_repository.dart';
import '../../../services/api_service.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => QuizRepository(Get.find<ApiService>()));
    Get.put(QuizController());
  }
}
