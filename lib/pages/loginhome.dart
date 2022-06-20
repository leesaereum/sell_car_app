import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/login.dart';
import 'package:sell_car_app/pages/logingeneral.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),      
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if(snapshot.hasData) {
          //로그인 완료 후 가는 페이지 
          return  MyHome();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        } else{
          //로그인 페이지 
          return const Login();
        }
      }
      ),
  );
  }