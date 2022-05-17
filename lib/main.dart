import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohaned_assigment/e_commerce_assigment/login_page.dart';
import 'package:mohaned_assigment/note_app/controllers/authController.dart';
import 'package:mohaned_assigment/note_app/utils/root.dart';
import 'package:mohaned_assigment/note_app/utils/theme.dart';
import 'package:mohaned_assigment/quiz/quiz_list_page.dart';

import 'note_app/controllers/userController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Note',
      theme: Themes().lightTheme,
      darkTheme: Themes().dartTheme,
      themeMode: ThemeMode.system,
      home: Root(),
    );
  }
}
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   static  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Software Engineering Department';
//     return  MaterialApp(
//       navigatorKey: navigatorKey,
//       title: appTitle,
//       debugShowCheckedModeBanner: false,
//       home: const LoginPageView(),
//       // home: QuizListPage(),
//       // Scaffold(
//       //   resizeToAvoidBottomInset: false,
//       //   appBar: AppBar(
//       //     centerTitle: true,
//       //     backgroundColor: Colors.orange,
//       //     title: const Text(appTitle),
//       //   ),
//       //   body: const QuizListPage(),
//       // ),
//     );
//   }
// }
//
// class MyCustomForm extends StatelessWidget {
//   const MyCustomForm({Key? key}) : super(key: key);
//
//   Widget normalField({ String? hint , InputBorder? border , bool? isPassword = false}){
//     return  Padding(
//       padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//       child: TextField(
//         obscureText: isPassword!,
//         decoration: InputDecoration(
//           border:border?? const OutlineInputBorder(borderSide: BorderSide(color: Colors.black) ),
//           hintText:hint.toString() ,
//           focusedBorder:  border?.copyWith(
//               borderSide: const BorderSide(color: Colors.black)),
//         ),
//       ),
//     );
//   }
// Widget iconFieldWidget({ String? hint , InputBorder? border , IconData? icon}){
//     return  Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          Padding(
//           padding:const EdgeInsets.only(top: 28),
//           child: Icon(icon??Icons.person),
//         ),
//         const SizedBox(width: 10,),
//         Expanded(child: normalField(hint: hint??"User Name",border:border??const  UnderlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20))))),
//       ],
//     );
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           const Text("Student enrollment"),
//           const SizedBox(height: 10,),
//           CircleAvatar(radius: 50,child: ClipOval(child: Image.network("https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png")),),
//           const SizedBox(height: 20,),
//           iconFieldWidget(),
//           const SizedBox(height: 10,),
//           normalField(hint: "First Name",border:const  OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20)))),
//           const SizedBox(height: 10,),
//           normalField(hint: "Last Name",border: const UnderlineInputBorder()),
//           const SizedBox(height: 10,),
//           normalField(hint: "Password",border: const UnderlineInputBorder(),isPassword: true),
//           const SizedBox(height: 10,),
//           normalField(hint: "@ Email",border: const UnderlineInputBorder(),isPassword: true),
//           const SizedBox(height: 10,),
//           iconFieldWidget(hint: "Phone Number",border: const UnderlineInputBorder() ,icon:const IconData(0xe4a2, fontFamily: 'MaterialIcons'))
//         ],
//       ),
//     );
//   }
// }