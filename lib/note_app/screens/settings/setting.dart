import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohaned_assigment/note_app/controllers/authController.dart';
import 'package:mohaned_assigment/note_app/screens/settings/account.dart';
import 'package:mohaned_assigment/note_app/screens/settings/dark_mode.dart';
import 'package:mohaned_assigment/note_app/screens/settings/widgets/list_tile.dart';
import 'package:mohaned_assigment/note_app/screens/widgets/custom_icon_btn.dart';

class Setting extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconBtn(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTileSetting(
                onTap: () {
                  Get.to(() => Account());
                },
                title: "Account",
                iconData: Icons.person,
                subtitle: null,
              ),
              ListTileSetting(
                onTap: () {
                  Get.to(() => DarkMode());
                },
                title: "Dark Mode",
                iconData: Icons.nights_stay,
                subtitle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}