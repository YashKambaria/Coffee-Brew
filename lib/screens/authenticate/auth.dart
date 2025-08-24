import 'package:coffee_brew/screens/authenticate/register.dart';
import 'package:coffee_brew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Register());
  }
}
