import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_dimensions.dart';
import '../controllers/profile_controller.dart';
import '../../home/controllers/home_controller.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final controller = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController roleController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: controller.name.value);
    emailController = TextEditingController(text: controller.email.value);
    roleController = TextEditingController(text: controller.role.value);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your name';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your email';
                  if (!GetUtils.isEmail(value)) return 'Please enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: roleController,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work),
                  hintText: 'e.g. Flutter Developer',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your role';
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await controller.updateProfile(
                      nameController.text, 
                      emailController.text,
                      roleController.text,
                    );
                    Get.find<HomeController>().loadUserData();
                    Get.back();
                    Get.snackbar(
                      'Success', 
                      'Profile updated successfully', 
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.success,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
