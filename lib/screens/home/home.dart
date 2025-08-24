import 'package:coffee_brew/services/auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _auth=AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        title: Text("Brew Crew",style: TextStyle(
          color: Colors.white,
        ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                  _auth.logOut();
              },
            child: Row(
              children: [
                Icon(Icons.person,size: 35,color: Colors.black,),
                Text("Log Out",style: TextStyle(color: Colors.black,fontSize: 20),),
              ],
            ),

          )
        ],
      ),
    );
  }
}
