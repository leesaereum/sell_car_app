import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:provider/provider.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/signin.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;
import 'package:sell_car_app/tab.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //password
  // 비번 visible= 안보임이 초기상태
  bool _pwState = true;
  String hint = "";
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  //유효성 검사
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pwState = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "images/sellcar.png",
            width: 180,
          ),
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  const Text(
                    "Welcome to SELL CAR ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //id -email
                  Container(
                    height: 120.0,
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: idController,
                      //화면에 들어오면 autofocus
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        //빈 값 입력
                        if (value == null || value.isEmpty) {
                          return "\u26A0 The Email is required";
                        } // 이메일 형식이 아닐경우
                        if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)) {
                          return '\u26A0 Invalid Email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Fill your email",
                          labelText: 'EMAIL',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 4, 31, 56)),
                          // 배경색  채우기ƒ
                          filled: true,
                          fillColor: const Color.fromARGB(255, 224, 229, 252),
                          //에러 스타일 - 클릭 안할시
                          errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(48, 64, 68, 90))),
                          //에러 테두리 - 클릭할시
                          focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(133, 64, 68, 90))),
                          //클릭시  보이는 테두리
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(133, 64, 68, 90))),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(48, 64, 68, 90))),
                          //텍스트필드 맨 앞 아이콘
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Color.fromARGB(255, 4, 31, 56),
                          ),
                          //텍스트필드 뒤에 아이콘
                          //이메일 내용 한꺼번에 지우기
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  idController.clear();
                                });
                              },
                              icon: const Icon(
                                Icons.clear_rounded,
                                color: Colors.grey,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //pw
                  Container(
                    height: 120.0,
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: pwController,
                      keyboardType: TextInputType.text,
                      //아이콘 누르면 비번 보이게 ,누르기 전 안보임
                      obscureText: _pwState,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "\u26A0 The Email is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Fill your password",
                        labelText: 'PASSWORD',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 4, 31, 56)),
                        // 배경색  채우기
                        filled: true,
                        fillColor: const Color.fromARGB(255, 224, 229, 252),
                        //에러 스타일 - 클릭 안할시
                        errorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(48, 64, 68, 90))),
                        //에러 테두리 - 클릭할시
                        focusedErrorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(133, 64, 68, 90))),
                        //클릭할 시 보이는 테두리
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(133, 64, 68, 90))),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(48, 64, 68, 90))),
                        //텍스트필드 뒤에 아이콘
                        suffixIcon: _pwState
                            ?
                            //true - pw 안보이게
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    //false로 변환
                                    _pwState = !_pwState;
                                  });
                                },
                                icon: const Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    //true로 반환
                                    _pwState = !_pwState;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black87,
                                )),
                        //텍스트필드 앞에 아이콘
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color.fromARGB(255, 4, 31, 56),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 10,
                          ),
                          Text(hint,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.red[300]))
                        ],
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        //아이디, 비번 둘다 정규식에 유효하면 홈으로가기
                        _login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 4, 31, 56),
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signin(),
                            ));
                      },
                      icon: const Icon(
                        Icons.email_rounded,
                        size: 32,
                      ),
                      label: const Text(
                        "Sign Up with Email",
                        style: TextStyle(fontSize: 19),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 4, 31, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(250, 45),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //functions
  // 로그인 성공
  // DB 연결
  _login() async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/login.jsp?id=${idController.text}&pw=${pwController.text}");
    var response = await http.get(url);
    setState(() {
      var jSON = json.decode(utf8.decode(response.bodyBytes));
      var result = jSON['result'];
      if (result[0]['id'] == 'fail') {
        loginFail();
      } else if (result[0]['leaveday'] != null) {
        //탈퇴회원
        cantLogin();
      } else {
        Static.id = result[0]['id'];
        Static.pw = pwController.text;
        Static.nickname = result[0]['nickname'];
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Tabs(),
            ));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const CheckHome(),
        //     ));
      }
    });
  }

  //로그인 실패
  loginFail() {
    if (pwController.text.isNotEmpty && idController.text.isNotEmpty) {
      setState(() {
        //error unicode
        hint = "\u26A0 There is no infomation \n entered Email, password";
      });
    } else {
      setState(() {
        hint = "";
      });
    }
  }

  // 해당 아이디(탈퇴)로는 로그인할수 없습니다.
  cantLogin() {
    if (pwController.text.isNotEmpty && idController.text.isNotEmpty) {
      setState(() {
        //error unicode
        hint =
            "\u26A0 Can't Log In in this Email(signout)\nPlease check again.";
      });
    } else {
      setState(() {
        hint = "";
      });
    }
  }
}
//END
