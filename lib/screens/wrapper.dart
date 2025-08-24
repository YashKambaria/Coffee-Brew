import 'package:coffee_brew/screens/authenticate/auth.dart';
import 'package:coffee_brew/screens/home/home.dart';
import 'package:coffee_brew/screens/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<MyUser?>(context);
    print(user);
    //return home or auth
    return user==null?Auth():Home();
  }
}
