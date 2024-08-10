import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_developer_intern/domain/entities/user.dart';

Widget userCard({
  required User user,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
    ),
    child: ListTile(
      leading: ClipOval(
        child: Image.network(
          user.avatar,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: () {
        Get.back(result: user);
      },
    ),
  );
}
