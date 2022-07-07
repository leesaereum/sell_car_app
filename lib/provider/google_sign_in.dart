// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class GoogleSignInProvider extends ChangeNotifier {
// final googleSignIn = GoogleSignIn();

// GoogleSignInAccount? _user;

// GoogleSignInAccount get user => _user!;
// //login 
// Future googleLogin() async {
//   try {
    
//   final googleUser = await googleSignIn.signIn();
//   //user = null
//   if (googleUser == null ) return;
//   _user = googleUser;
  

//   final googleAuth = await googleUser.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
  
//   await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     print(e.toString());
//   }
//   notifyListeners();

//   }

//   //log out 
//   Future googleLogout() async{
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }

// }