import 'package:get/get.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/result/controllers/result_controller.dart';
import '../modules/result/views/result_view.dart';
import '../modules/difficulty/views/difficulty_view.dart';
import '../modules/profile/views/update_profile_view.dart';
import '../modules/profile/views/settings_view.dart';
import '../modules/profile/views/statistics_view.dart';
import '../modules/profile/views/help_support_view.dart';
import '../modules/profile/views/about_view.dart';
import '../modules/profile/views/legal_view.dart';
import '../modules/profile/views/report_problem_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.quiz,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.result,
      page: () => const ResultView(),
      binding: BindingsBuilder(() {
        Get.put(ResultController());
      }),
    ),
    GetPage(
      name: AppRoutes.difficulty,
      page: () => const DifficultyView(),
    ),
    GetPage(
      name: AppRoutes.updateProfile,
      page: () => const UpdateProfileView(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: AppRoutes.statistics,
      page: () => const StatisticsView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.helpSupport,
      page: () => const HelpSupportView(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutView(),
    ),
    GetPage(
      name: AppRoutes.reportProblem,
      page: () => const ReportProblemView(),
    ),
    GetPage(
      name: AppRoutes.privacy,
      page: () => const LegalView(
        title: 'Privacy Policy',
        content: 'Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you use Quiz Pro.\n\n1. Information Collection: We collect profile data (name, email) saved locally on your device.\n2. Quiz Records: Your quiz performance is stored locally via SharedPreferences.\n3. API Usage: We fetch questions from Open Trivia DB. No personal data is sent to the API.\n4. Local Storage: We use SharedPreferences for app settings and theme preferences.\n5. Changes: We may update this policy periodically.',
      ),
    ),
    GetPage(
      name: AppRoutes.terms,
      page: () => const LegalView(
        title: 'Terms & Conditions',
        content: 'Welcome to Quiz Pro. By using this app, you agree to these terms.\n\n1. Use of App: You agree to use the app for personal, non-commercial purposes.\n2. Content: Quiz questions are provided by Open Trivia DB and are for educational/entertainment use.\n3. Responsibility: You are responsible for maintaining the privacy of your local data.\n4. Liability: We are not liable for any data loss or issues arising from API unavailability.\n5. Termination: We reserve the right to modify or terminate the app at any time.',
      ),
    ),
  ];
}
