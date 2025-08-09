import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  // _ means we do not want to use this variable outside this class
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future singInAnon() async{
    try{
      UserCredential result= await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}