import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../core/values/app_dimensions.dart';
import '../../../../core/values/app_colors.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  static const List<Map<String, dynamic>> categories = [
    {'id': 0, 'name': 'Mixed', 'icon': Icons.all_inclusive, 'color': Colors.purple},
    {'id': 9, 'name': 'General Knowledge', 'icon': Icons.lightbulb, 'color': Colors.amber},
    {'id': 21, 'name': 'Sports', 'icon': Icons.sports_basketball, 'color': Colors.orange},
    {'id': 17, 'name': 'Science', 'icon': Icons.science, 'color': Colors.green},
    {'id': 23, 'name': 'History', 'icon': Icons.history_edu, 'color': Colors.brown},
    {'id': 22, 'name': 'Geography', 'icon': Icons.public, 'color': Colors.blue},
    {'id': 18, 'name': 'Technology', 'icon': Icons.computer, 'color': Colors.cyan},
    {'id': 11, 'name': 'Film', 'icon': Icons.movie, 'color': Colors.red},
    {'id': 12, 'name': 'Music', 'icon': Icons.music_note, 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(context, category);
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Map<String, dynamic> category) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.difficulty, arguments: category),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: category['color'].withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(category['icon'], color: category['color'], size: 40),
            ),
            const SizedBox(height: 12),
            Text(
              category['name'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.textPrimaryLight
                        : AppColors.textPrimaryDark,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
