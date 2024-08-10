import 'package:get/get.dart';
import 'package:mobile_developer_intern/core/constants/text_constants.dart';

class HomeController extends GetxController {
  var selectedUserName = TextConstants.selectedUserName.obs;

  void updateUserName(String newName) {
    selectedUserName.value = newName;
  }
}
