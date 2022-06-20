import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
//
String name ="";
String email ="";
String url ="";


 //   
  TextEditingController id = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController checkpassword = TextEditingController();
 
 @override
  void initState() {
    super.initState();

  }
 
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('SELL CAR'),
            backgroundColor: Color.fromARGB(255, 4, 31, 56),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  const Text(
                    'SIGN-IN',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  
                  //email 
                  Container(
                    height: 100,
                  padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: id,
                      //유효성검사
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "The Email is required";
                    } 
                    if(!RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)){
                    return 'Invalid Email address';
                  }
                  return null; 
                  },
                      decoration: InputDecoration(labelText: 'ID'),
                    ),
                  ),
                  Container(
                    height: 100,
                  padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nickname,
                      decoration: const InputDecoration(labelText: 'NICKNAME'),
                    ),
                  ),
                  Container(
                    height: 100,
                  padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: password,
                      decoration: const InputDecoration(labelText: 'PASSWORD'),
                    ),
                  ),
                  Container(
                    height: 100,
                  padding: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 50),
                      child: TextFormField(
                        controller: checkpassword,
                        decoration:
                            const InputDecoration(labelText: 'CHECK PASSWORD'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 4, 31, 56)),
                      onPressed: () {
                        chekckLogin();
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  //functions 
chekckLogin() {

}

join() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/signin.jsp?id=${id.text}&pw=${password.text}&nickname=${nickname.text}');
    var response = await http.get(url);

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      var result = JSON['result'];

      if (result == 'OK') {
        sucessJoin();
      } else {
        failJoin();
      }
    });
  }

  

  sucessJoin() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('회원가입이 완료되었습니다.'),
            actions: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text('로그인하러 가기')),
              )
            ],
          );
        });
  }

  failJoin() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('입력하신 정보들을 다시 확인하여주세요.'),
      backgroundColor: Colors.red,
    ));
  }

  cantSignin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('해당 아이디(탈퇴 아이디)로는 회원가입을 할 수 없습니다.'),
        backgroundColor: Colors.grey,
      ),
    );
  }

} //end 
