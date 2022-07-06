import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/login.dart';
import 'package:sell_car_app/static.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  //property
  // password visible= 안보임이 초기상태
  bool _pwState = true;
  bool _pwagainState = true;
  late String hint = "";
  TextEditingController id = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController checkpassword = TextEditingController();

  //유효성 검사
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _pwState = true;
    _pwagainState = true;
  }

  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'SIGN-IN',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    //email
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: id,
                        //화면에 들어오면 autofocus
                        autofocus: true,
                        //유효성 검사
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "\u26A0 The Email is required";
                          } //email address에 맞지 않으면
                          if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return '\u26A0 Invalid Email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: "Fill your Email",
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
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                              color: Color.fromARGB(255, 4, 31, 56),
                            ),
                            //텍스트필드 뒤에 아이콘
                            //clear
                            suffixIcon: id.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        id.clear();
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: Colors.grey,
                                    ))
                                : null),
                      ),
                    ),
                    // nickname
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: nickname,
                        // 유효성 검사
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "\u26A0 The Nickname is required";
                          } //10문자 이내 2문자 이상
                          if (value.length < 2 || value.length > 10) {
                            return "\u26A0 The Nickname is valid 2 to 10 characters.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'NICKNAME',
                            hintText: "Fill your Nickname",
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
                              Icons.abc,
                              color: Color.fromARGB(255, 4, 31, 56),
                            ),
                            //텍스트필드 뒤에 아이콘
                            //clear
                            suffixIcon: nickname.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        nickname.clear();
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: Colors.grey,
                                    ))
                                : null),
                      ),
                    ),
                    //pw
                    Container(
                      height: 130,
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: password,
                        //아이콘 누르면 비번 보이게 ,누르기 전 안보임
                        obscureText: _pwState,
                        // 유효성 검사
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "\u26A0 The password is required";
                          } //영어대소문자, 숫자, 특수문자 1자 이상 포함 6자 이상 15자 이내
                          if (!RegExp(
                                  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{6,15}$')
                              .hasMatch(value)) {
                            return "\u26A0 Enter 6 to 15 characters including \nspecial characters,numbers";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          hintText: "Fill your password",
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
                    //check - password 
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: checkpassword,
                        //아이콘 누르면 비번 보이게 ,누르기 전 안보임
                        obscureText: _pwagainState,
                        // 유효성 검사
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "\u26A0 The password check is required";
                          } //비밀번호와 일치 않음
                          if (value != password.text) {
                            return "\u26A0 Not match your password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'CHECK PASSWORD',
                          hintText: "Check your password",
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
                          suffixIcon: _pwagainState
                              ?
                              //true - pw 안보이게
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      //false로 변환
                                      _pwagainState = !_pwagainState;
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
                                      _pwagainState = !_pwagainState;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black87,
                                  )),
                          //텍스트필드 앞에 아이콘
                          prefixIcon: const Icon(
                            Icons.check_box,
                            color: Color.fromARGB(255, 4, 31, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        hint,
                        style: TextStyle(color: Colors.red[300]),
                      ),
                    ),
                    //submit
                    Container(
                        height: 20.0,
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          hint,
                          style: const TextStyle(color: Colors.red),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 4, 31, 56)),
                        onPressed: () {
                          //정규식에 유효하면
                          if (formkey.currentState!.validate()) {
                            chekckEmail();
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  //functions
  //아이디 중복 확인
  chekckEmail() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/sell_car/checkid.jsp?id=${id.text}');
    var response = await http.get(url);
    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      var result = JSON['result'];
      var ids = JSON['result']['id'];
      // db와 같은 아이디가 있으면
      if (ids == id.text) {
        sameEmail();
  
      //leaveday 가 있으면 
      if (Static.leaveday.isNotEmpty) {
          cantSignin();
        }
      }else {
        setState(() {
          hint = "";
        });
        join();
      }
    });
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
            content: const Text('SignIn is successfully completed!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //홈으로 가기
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckHome(),
                        ));
                  },
                  child: const Text("Home")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //로그인
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  child: const Text("Go to Login"))
            ],
          );
        });
  }

  // 중복아이디
  // hint
  sameEmail() {
    //아이디 입력 후
    if(id.text.isNotEmpty) {
    setState(() {
      hint = "\u26A0 Email is duplicated. Please write another Email";
    });

     }
  }

  failJoin() {
    setState(() {
      hint = "\u26A0 Please check the information you entered again";
    });
  }

  cantSignin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Can't Sign up with this email(signout email)"),
        backgroundColor: Colors.grey,
      ),
    );
  }
}


