import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';
import 'package:mobile_developer_intern/presentation/controllers/home_controller.dart';
import 'package:mobile_developer_intern/presentation/widgets/action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final String name = arguments?['name'] ?? 'Guest';
    final HomeController controller = Get.put(HomeController());

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: const Color(0xFF498EAC),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            TextConstants.secondScreen,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    TextConstants.welcome,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Center(
                child: Obx(() {
                  return Text(
                    controller.selectedUserName.value.isNotEmpty
                        ? controller.selectedUserName.value
                        : TextConstants.selectedUserName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: actionButtonLogin(
                  label: TextConstants.chooseAUser,
                  onPressed: () async {
                    final selectedUser = await Get.toNamed('/user') as User?;
                    if (selectedUser != null) {
                      controller.updateUserName(
                        '${selectedUser.firstName} ${selectedUser.lastName}',
                      );
                    } else {
                      controller.updateUserName(TextConstants.noUserSelected);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
