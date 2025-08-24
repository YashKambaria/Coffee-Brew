import 'package:coffee_brew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String username='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text(
          "Welcome to Coffee Brew",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown.shade400,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    username=val;
                  });
                },
                decoration: InputDecoration(hintText: "Username"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    password=val;
                  });
                },
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async{
                  print(username);
                  print(password);
                },
                child: Text("Register",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () async{
              //     Navigator.pushReplacement((context), SignIn() as Route<Object?>);
              //   },
              //   child: Text("Already Register? Sign Up",style: TextStyle(color: Colors.white),),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.brown.shade400,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
