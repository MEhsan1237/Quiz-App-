import 'dart:convert';

class QuizHistoryModel {
  final String id;
  final String category;
  final String difficulty;
  final int totalQuestions;
  final int correctAnswers;
  final int score;
  final double accuracy;
  final DateTime date;

  QuizHistoryModel({
    required this.id,
    required this.category,
    required this.difficulty,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.score,
    required this.accuracy,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'difficulty': difficulty,
        'totalQuestions': totalQuestions,
        'correctAnswers': correctAnswers,
        'score': score,
        'accuracy': accuracy,
        'date': date.toIso8601String(),
      };

  factory QuizHistoryModel.fromJson(Map<String, dynamic> json) => QuizHistoryModel(
        id: json['id'],
        category: json['category'],
        difficulty: json['difficulty'],
        totalQuestions: json['totalQuestions'],
        correctAnswers: json['correctAnswers'],
        score: json['score'],
        accuracy: json['accuracy'],
        date: DateTime.parse(json['date']),
      );

  String toRawJson() => json.encode(toJson());
  factory QuizHistoryModel.fromRawJson(String str) => QuizHistoryModel.fromJson(json.decode(str));
}
