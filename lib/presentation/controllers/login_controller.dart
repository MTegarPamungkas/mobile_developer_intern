import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var nameController = TextEditingController();
  var palindromeController = TextEditingController();

  bool isPalindrome(String text) {
    String sanitizedText = text.replaceAll(RegExp(r'\W+'), '').toLowerCase();
    String reversedText = sanitizedText.split('').reversed.join('');
    return sanitizedText == reversedText;
  }
}
