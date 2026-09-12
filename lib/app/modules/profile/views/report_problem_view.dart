import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';

class ReportProblemView extends StatefulWidget {
  const ReportProblemView({super.key});

  @override
  State<ReportProblemView> createState() => _ReportProblemViewState();
}

class _ReportProblemViewState extends State<ReportProblemView> {
  final _formKey = GlobalKey<FormState>();
  String? selectedType;
  final descController = TextEditingController();

  final List<String> problemTypes = [
    'Quiz issue',
    'Question issue',
    'App performance',
    'UI issue',
    'Account/profile',
    'Other',
  ];

  @override
  void dispose() {
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Problem'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Help us improve the app by reporting any issues you encounter.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: const InputDecoration(
                  labelText: 'Problem Type',
                  border: OutlineInputBorder(),
                ),
                items: problemTypes.map((type) => DropdownMenuItem(
                  value: type,
                  child: Text(type),
                )).toList(),
                onChanged: (val) => setState(() => selectedType = val),
                validator: (value) => value == null ? 'Please select a problem type' : null,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: descController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Tell us what happened...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) => (value == null || value.isEmpty) ? 'Please describe the problem' : null,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back();
                    Get.snackbar(
                      'Thank You', 
                      'Your report has been submitted. We will look into it.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.success,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
