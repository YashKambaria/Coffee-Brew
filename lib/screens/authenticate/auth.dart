import 'package:coffee_brew/screens/authenticate/register.dart';
import 'package:coffee_brew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isSignIn=true;

  void toggle(){
    setState(() {
      isSignIn=!isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isSignIn){
      return SignIn(toggle:toggle);
    }
    else{
      return Register(toggle:toggle);
    }
  }
}
