import 'package:coffee_brew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key=GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String username = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text(
          "Welcome to Coffee Brew",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.toggle();
            },
            child: Row(
              children: [
                Icon(Icons.person, size: 30, color: Colors.black),
                Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.brown.shade400,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                validator: (val)=> val!.isEmpty? "Enter the Email":null,
                onChanged: (val) {
                  setState(() {
                    username = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val)=> val!.length<6? "Enter the Password 6 char long":null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  if(_key.currentState!.validate()){
                   dynamic result= await _auth.registerWithEmailAndPassword(username, password);
                   if(result==null){
                     setState(() {
                       error="please supply a valid email";
                     });
                   }
                  }

                },
                child: Text("Register", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                ),
              ),
              Text(error,style: TextStyle(
                color: Colors.red,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
