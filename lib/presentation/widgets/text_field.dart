import 'package:flutter/material.dart';

Widget textFieldLogin({
  required String placeholder,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: placeholder,
      hintStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: Colors.white,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(18.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
  );
}
