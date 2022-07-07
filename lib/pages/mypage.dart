import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/login.dart';
import 'package:sell_car_app/static.dart';
import 'package:sell_car_app/tab.dart';
import 'package:http/http.dart' as http;

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
                    decoration: InputDecoration(
                      labelText: 'NICKNAME',
                      hintText: 'ENTER NEW NICKNAME',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            invisible = !invisible;
                          });
                        },
                        child: Icon(
                          invisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
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
                        onPressed: () {
                          modifyAlert();
                        },
                        child: const Text(
                          'MODIFY',
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
                          
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('COMPLETE TO LOGOUT'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        },
                        child: const Text(
                          'LOGOUT',
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
                      deleteAccount();
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

  modifyAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('MODIFY INFORMATION'),
            content: const Text('DO YOU WANT TO MODIFY YOUR INFORMATION?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      modify();
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

  modify() async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/mypagemodify.jsp?id=${Static.id}&nick=${nickname.text}&pw=${password.text}");
    var response = await http.get(url);
    String result = "";

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      result = JSON['result'];
    });

    if (result == "OK") {
      _showdialog(context);
    } else {
      errorSnackbar(context);
    }
  }

  _showdialog(BuildContext context) {
    setState(() {
      Static.nickname = nickname.text;
    });
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Tabs(),
        ));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('COMPLETE TO MODIFY YOUR INFORMATION'),
      duration: Duration(seconds: 2),
      backgroundColor: Color.fromARGB(255, 4, 31, 56),
    ));
  }

  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("SORRY, CAN'T MODIFY YOUR INFORMATION :(\nTRY ONE TIME"),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }

  deleteAccount() async {
    print(Static.id);
    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/deleteaccount.jsp?id=${Static.id}");
    var response = await http.get(url);
    String result = "";

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      result = JSON['result'];
    });

    if (result == "OK") {
      setState(() {
        Static.id = "";
        Static.nickname = "";
      });
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Tabs(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('COMPLETE TO DELETE YOUR ACCOUNT'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("SORRY, CAN'T DELETE YOUR ACCOUNT :(\nTRY ONE TIME"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ));
    }
  }
}
