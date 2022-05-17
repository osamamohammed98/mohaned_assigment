import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohaned_assigment/note_app/controllers/authController.dart';
import 'package:mohaned_assigment/note_app/screens/auth/login.dart';
import 'package:mohaned_assigment/note_app/screens/home/home.dart';

class Root extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        authController.userModel.value;
        if (authController.user != null && authController.user!.uid .isNotEmpty) {
          return HomePage();
        } else {
          return Login();
        }
      },
    );
  }
}
