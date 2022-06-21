import 'dart:convert';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/checkbrand.dart';
import 'package:sell_car_app/pages/signin.dart';
import 'package:sell_car_app/provider/google_sign_in.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  //password
  // 비번 visible= 안보임이 초기상태
  bool _pwState = true;
  String Hint = "";
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
                          hintText: "\u26A0 Please enter your email",
                          labelText: 'EMAIL',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 4, 31, 56)),
                          // 배경색  채우기
                          filled: true,
                          fillColor: Color.fromARGB(255, 224, 229, 252),
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
                          //clear
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
                        hintText: "Please enter your password",
                        labelText: 'PASSWORD',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 4, 31, 56)),
                        // 배경색  채우기
                        filled: true,
                        fillColor: Color.fromARGB(255, 224, 229, 252),
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
                          Text(Hint,
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
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 19),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 4, 31, 56),
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
                  ElevatedButton.icon(
                      onPressed: () {
                        // final provider = Provider.of<GoogleSignInProvider>(
                        //     context,
                        //     listen: false);
                        // provider.googleLogin();
                      },
                      icon: Image.asset(
                        "images/googlelogo.png",
                        height: 32.0,
                      ),
                      label: const Text(
                        "Sign Up with Google",
                        style: TextStyle(fontSize: 19),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 4, 31, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(250, 45),
                      )),
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
        login_fail();
      } else if (result[0]['leaveday'] != null) {
        //탈퇴회원
        cantLogin();
      } else {
        Static.id = result[0]['id'];
        Static.pw = pwController.text;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckHome(),
            ));
      }
    });
  }

  //로그인 실패
  login_fail() {
    if (pwController.text.isNotEmpty && idController.text.isNotEmpty) {
      setState(() {
        //error unicode
        Hint = "\u26A0 There is no infromation entered Email, password";
      });
    } else {
      setState(() {
        Hint = "";
      });
    }
  }

  // 해당 아이디(탈퇴)로는 로그인할수 없습니다.
  cantLogin() {
    if (pwController.text.isNotEmpty && idController.text.isNotEmpty) {
      setState(() {
        //error unicode
        Hint =
            "\u26A0 Can't Log In in this Email(signout Email)\nPlease check again.";
      });
    } else {
      setState(() {
        Hint = "";
      });
    }
  }
} //END
