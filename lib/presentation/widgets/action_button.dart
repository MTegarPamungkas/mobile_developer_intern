import 'package:flutter/material.dart';

Widget actionButtonLogin({
  required String label,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2E6688),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: onPressed,
      child: Text(label),
    ),
  );
}
