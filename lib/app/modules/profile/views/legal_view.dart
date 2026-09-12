import 'package:flutter/material.dart';
import '../../../core/values/app_dimensions.dart';

class LegalView extends StatelessWidget {
  final String title;
  final String content;

  const LegalView({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Text(
          content,
          style: const TextStyle(fontSize: 14, height: 1.5),
        ),
      ),
    );
  }
}
