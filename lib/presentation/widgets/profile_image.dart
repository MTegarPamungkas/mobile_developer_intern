import 'package:flutter/material.dart';

Widget profileImageLogin() {
  return Container(
    width: 100,
    height: 100,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent,
    ),
    child: ClipOval(
      child: Image.asset(
        'assets/images/ic_photo.png',
        fit: BoxFit.cover,
      ),
    ),
  );
}
