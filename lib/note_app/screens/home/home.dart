import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mohaned_assigment/note_app/controllers/authController.dart';
import 'package:mohaned_assigment/note_app/controllers/noteController.dart';
import 'package:mohaned_assigment/note_app/screens/home/add_note.dart';
import 'package:mohaned_assigment/note_app/screens/home/note_list.dart';
import 'package:mohaned_assigment/note_app/screens/settings/setting.dart';
import 'package:mohaned_assigment/note_app/screens/widgets/custom_icon_btn.dart';

class HomePage extends GetWidget<AuthController> {
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
          child: Obx(() => Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconBtn(
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            authController.axisCount.value =
                                authController.axisCount.value == 2 ? 4 : 2;
                          },
                          icon: Icon(authController.axisCount.value == 2
                              ? Icons.list
                              : Icons.grid_on),
                        ),
                        Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomIconBtn(
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            Get.to(() => Setting());
                          },
                          icon: Icon(
                            Icons.settings,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetX<NoteController>(
                      init: Get.put<NoteController>(NoteController()),
                      builder: (NoteController noteController) {
                        if (noteController != null &&
                            noteController.notes != null) {
                          return NoteList();
                        } else {
                          return Text("No notes, create some ");
                        }
                      }),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: () {
            Get.to(() => AddNotePage());
          },
          child: Icon(
            Icons.note_add,
            size: 30,
          )),
    );
  }
}
