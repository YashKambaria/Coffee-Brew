import 'package:coffee_brew/screens/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  // _ means we do not want to use this variable outside this class
  final FirebaseAuth _auth=FirebaseAuth.instance;

  MyUser? _userFromFireBaseUser(User? user){
      return user !=null ?MyUser(uid: user.uid):null;
  }

  Stream<MyUser?> get user{
    return _auth.authStateChanges()
        .map(_userFromFireBaseUser);
  }


  Future singInAnon() async{
    try{
      UserCredential result= await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future logOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}