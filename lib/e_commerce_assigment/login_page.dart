import 'package:flutter/material.dart';
import 'package:mohaned_assigment/e_commerce_assigment/home_page.dart';
import 'package:mohaned_assigment/e_commerce_assigment/signup_page.dart';

class LoginPageView extends StatelessWidget with InputValidationMixin {
  const LoginPageView({Key? key}) : super(key: key);

  static final  GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.orange,
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formStateKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child:const FlutterLogo()),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding:const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (email) {
                    if (isEmailValid(email.toString())) {
                      return null;
                    } else {
                      return 'Enter a valid email address';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
               Padding(
                padding:const  EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                    validator: (password) {
                      if (isPasswordValid(password.toString())) {
                        return null;
                      } else {
                        return 'Enter a valid password';
                      }
                    },
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              FlatButton(

                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child:const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.orange, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    if(_formStateKey.currentState!.validate()) {
                      _formStateKey.currentState!.save();
                      // Navigator.push(
                      //   context, MaterialPageRoute(builder: (_) => HomePageView()));
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (_) => HomePageView() ),ModalRoute.withName(''));
                    }
                  },
                  child:const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
             const SizedBox(
                height: 130,
              ),
              InkWell(onTap: (){
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (_) => SignupPageView() ),ModalRoute.withName(''));
              },child: const Text('New User? Create Account'))
            ],
          ),
        ),
      ),
    );
  }


}
mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) {
    RegExp regex =  RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }
}