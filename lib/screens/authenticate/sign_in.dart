import 'package:coffee_brew/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn({super.key,required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          "Sign In to Coffee Brew",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown.shade400,
        actions: [
          TextButton(
            onPressed: () {
              widget.toggle();
            },
            child: Row(
              children: [
                Icon(Icons.person,size: 30,color: Colors.black,),
                Text("Register",style: TextStyle(color: Colors.black,fontSize: 15),),
              ],
            ),

          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    username=val;
                  });
                },
                validator: (val)=> val!.isEmpty? "Enter the Email":null,
                decoration: InputDecoration(hintText: "Username",fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink,width: 2),
                    )),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    password=val;
                  });
                },
                validator: (val)=> val!.length<6? "Enter the Password 6 char long":null,
                decoration: InputDecoration(hintText: "Password",fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink,width: 2),
                    )),
                obscureText: true,
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  if(_key.currentState!.validate()){
                    dynamic result= await _auth.signWithEmailAndPassword(username, password);
                    if(result==null){
                      setState(() {
                        error="INVALID CREDENTIAL";
                      });
                    }
                  }

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                ),
                child: Text("Sign In",style: TextStyle(color: Colors.white),),
              ),
              Text(error,style: TextStyle(
                color: Colors.red
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
