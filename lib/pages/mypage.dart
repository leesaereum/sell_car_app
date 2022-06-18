import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sell_car_app/main.dart';
import 'package:sell_car_app/provider/google_sign_in.dart';


class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name ="";
  String email ="";
  String photo ="";

  //
  TextEditingController id = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  //
  
  
  

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SELL CAR'),
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'MYPAGE',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                //google profile 
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  "Hi   " + user.displayName! ,
                  style : TextStyle(
                    color : Colors.black87,
                    fontSize: 20,
                  )
                  ),
                  const SizedBox(
                      height: 20,
                  ),
                  Text(
                    'Email : ' + user.email!  ,
                   style : TextStyle(
                    color : Colors.black87,
                    fontSize: 16,
                  )
                  ),
                  

                // ,Padding(
                //   padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                //   child: TextField(
                //     controller: id,
                //     decoration: const InputDecoration(labelText: 'ID'),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                //   child: TextField(
                //     controller: nickname,
                //     decoration: const InputDecoration(labelText: 'NICKNAME'),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(labelText: 'PASSWORD'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                          provider.googleLogout();
                          Navigator.push(
                            context,
                           MaterialPageRoute(
                            builder: (context) => const Home(),
                           ));
                        },
                        child: const Text(
                          'Log out',
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(width: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {

                        },
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
