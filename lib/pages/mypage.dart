import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/pages/login.dart';
import 'package:sell_car_app/static.dart';
import 'package:sell_car_app/tab.dart';

class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  TextEditingController id = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('images/sellcar.png', width: 180),
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 140),
                const Text(
                  'MYPAGE',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'WELCOME TO SELL CAR, ${Static.nickname}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextField(
                    controller: nickname,
                    decoration: const InputDecoration(
                      labelText: 'NICKNAME',
                      hintText: 'ENTER NEW NICKNAME',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
                  child: TextField(
                    controller: password,
                    obscureText: invisible,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: 'ENTER NEW PASSWORD',
                      helperText: 'NO MORE THAN 8 CHARACTERS',
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              invisible = !invisible;
                            });
                          },
                          child: Icon(invisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {},
                        child: const Text(
                          'REVISE',
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(width: 50),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {
                          setState(() {
                            Static.id = "";
                            Static.nickname = "";
                          });
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Tabs(),
                              ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('COMPLETE TO LOGOUT'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        },
                        child: const Text(
                          'RESIGN',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => deleteAlert(),
                  child: const Text(
                    'DELETE ACCOUNT',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  deleteAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DELETE ACCOUNT'),
            content: const Text('DO YOU WANT TO DELETE YOUR ACCOUNT?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      //DB 연동하기
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('COMPLETE TO DELETE YOUR ACCOUNT'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ));
                    },
                    child: const Text(
                      'YES',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 4, 31, 56)),
                    ),
                  ),
                  const SizedBox(width: 40),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'NO',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 4, 31, 56)),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
