import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohaned_assigment/note_app/controllers/authController.dart';
import 'package:mohaned_assigment/note_app/models/noteModel.dart';
import 'package:mohaned_assigment/note_app/services/database.dart';



class NoteController extends GetxController {
  RxList<NoteModel> noteList = RxList<NoteModel>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;

  // ignore: invalid_use_of_protected_member
  List<NoteModel> get notes => noteList.value;

  @override
  void onInit() {
    if(Get.find<AuthController>().user != null && Get.find<AuthController>().user!.uid.isNotEmpty) {
      String uid = Get.find<AuthController>().user!.uid.toString();
      print("NoteController onit :: $uid");
      noteList
          .bindStream(Database().noteStream(uid)); //stream coming from firebase
    }

    super.onInit();
  }
}
