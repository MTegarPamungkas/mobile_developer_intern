import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/presentation/controllers/user_controller.dart';
import 'package:mobile_developer_intern/presentation/widgets/user_card.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: const Color(0xFF498EAC),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          TextConstants.thirdScreen,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (users) => ListView.builder(
          itemCount: users?.length ?? 0,
          itemBuilder: (context, index) {
            final user = users![index];
            return userCard(user: user);
          },
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error ?? TextConstants.unknownError),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => controller.fetchUsers(),
                child: const Text(TextConstants.reload),
              ),
            ],
          ),
        ),
      ),
    );
  }
}