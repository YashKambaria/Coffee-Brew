import 'package:coffee_brew/screens/model/user.dart';
import 'package:coffee_brew/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text("Welcome to Coffee Brew",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.brown.shade400,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () async{
                  final MyUser user =await _auth.singInAnon();
                  if(user==null){
                    print("Error");
                  }
                  else{
                    print("Sign In");
                    print(user.uid);
                  }
              },
              child: Text("Sign In")),
        ),
      ),
    );
  }
}
