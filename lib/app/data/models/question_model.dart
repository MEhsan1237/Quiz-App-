import 'package:html/parser.dart';

class QuestionModel {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final List<String> allAnswers;

  QuestionModel({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.allAnswers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    String decode(String html) {
      return parse(html).body?.text ?? html;
    }

    final category = decode(json['category']);
    final difficulty = decode(json['difficulty']);
    final question = decode(json['question']);
    final correctAnswer = decode(json['correct_answer']);
    final incorrectAnswers = (json['incorrect_answers'] as List)
        .map((e) => decode(e.toString()))
        .toList();

    final allAnswers = [...incorrectAnswers, correctAnswer];
    allAnswers.shuffle();

    return QuestionModel(
      category: category,
      type: json['type'],
      difficulty: difficulty,
      question: question,
      correctAnswer: correctAnswer,
      incorrectAnswers: incorrectAnswers,
      allAnswers: allAnswers,
    );
  }
}
