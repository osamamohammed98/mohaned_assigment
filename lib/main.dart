import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Software Engineering Department';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  Widget normalField({ String? hint , InputBorder? border , bool? isPassword = false}){
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        obscureText: isPassword!,
        decoration: InputDecoration(
          border:border?? const OutlineInputBorder(borderSide: BorderSide(color: Colors.black) ),
          hintText:hint.toString() ,
          focusedBorder:  border?.copyWith(
              borderSide: const BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
Widget iconFieldWidget({ String? hint , InputBorder? border , IconData? icon}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding:const EdgeInsets.only(top: 28),
          child: Icon(icon??Icons.person),
        ),
        const SizedBox(width: 10,),
        Expanded(child: normalField(hint: hint??"User Name",border:border??const  UnderlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20))))),
      ],
    );
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Student enrollment"),
          const SizedBox(height: 10,),
          CircleAvatar(radius: 50,child: ClipOval(child: Image.network("https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png")),),
          const SizedBox(height: 20,),
          iconFieldWidget(),
          const SizedBox(height: 10,),
          normalField(hint: "First Name",border:const  OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20)))),
          const SizedBox(height: 10,),
          normalField(hint: "Last Name",border: const UnderlineInputBorder()),
          const SizedBox(height: 10,),
          normalField(hint: "Password",border: const UnderlineInputBorder(),isPassword: true),
          const SizedBox(height: 10,),
          normalField(hint: "@ Email",border: const UnderlineInputBorder(),isPassword: true),
          const SizedBox(height: 10,),
          iconFieldWidget(hint: "Phone Number",border: const UnderlineInputBorder() ,icon:const IconData(0xe4a2, fontFamily: 'MaterialIcons'))
        ],
      ),
    );
  }
}