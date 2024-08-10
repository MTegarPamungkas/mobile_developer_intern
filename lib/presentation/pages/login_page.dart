import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/presentation/controllers/login_controller.dart';
import 'package:mobile_developer_intern/presentation/widgets/action_button.dart';
import 'package:mobile_developer_intern/presentation/widgets/profile_image.dart';
import 'package:mobile_developer_intern/presentation/widgets/text_field.dart';
import 'package:mobile_developer_intern/presentation/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;
    final contentHeight = screenHeight - keyboardHeight;

    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF498EAC),
              Color(0xFF8BB9A8),
              Color(0xFF8C92AC),
              Color(0xFF2E6688),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.35, 0.65, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: contentHeight,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileImageLogin(),
                    const SizedBox(height: 48),
                    textFieldLogin(
                      placeholder: TextConstants.name,
                      controller: controller.nameController,
                    ),
                    const SizedBox(height: 16),
                    textFieldLogin(
                      placeholder: TextConstants.palindrome,
                      controller: controller.palindromeController,
                    ),
                    const SizedBox(height: 36),
                    actionButtonLogin(
                      label: TextConstants.check,
                      onPressed: () => _checkPalindrome(controller),
                    ),
                    const SizedBox(height: 16),
                    actionButtonLogin(
                      label: TextConstants.next,
                      onPressed: () => _goToNextPage(controller),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkPalindrome(LoginController controller) {
    String text = controller.palindromeController.text;

    if (text.isEmpty) {
      Get.snackbar(
        TextConstants.error,
        TextConstants.pleaseEnterTextToCheck,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    bool isPalindrome = controller.isPalindrome(text);

    Get.dialog(
      AlertDialog(
        title: const Text(TextConstants.checkPalindrome),
        content: Text(isPalindrome
            ? TextConstants.isPalindrome
            : TextConstants.notPalindrome),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(TextConstants.ok),
          ),
        ],
      ),
    );
  }

  void _goToNextPage(LoginController controller) {
    String name = controller.nameController.text;

    if (name.isEmpty) {
      Get.snackbar(
        TextConstants.error,
        TextConstants.pleaseEnterName,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    Get.toNamed(
      AppRoutes.home,
      arguments: {'name': name},
    );
  }
}
