import 'package:flutter/material.dart';
import 'package:project_login_app/loginhome.dart';
import 'package:project_login_app/signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //property
  //비번 안보이게 가리기, 첨에 안 보이게
  bool _pwState = true;
  String Hint = "";
  //late IconData errorIcon;
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //errorIcon;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("login"),
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100.0,
                    padding: const EdgeInsets.all(20),
                    //id
                    child: TextFormField(
                      controller: idcontroller,
                      keyboardType: TextInputType.emailAddress,
                      //최대 1줄
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 4, 31, 56)),
                        hintText: "Please enter your Email",
                        // 배경색  채우기
                        filled: true,
                        fillColor: Color.fromARGB(255, 224, 229, 252),
                        //클릭할 떄 보이는 테두리
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(133, 64, 68, 90))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(48, 64, 68, 90))),
                        //errorText: idHint,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //pw
                  Container(
                    height: 100.0,
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: pwcontroller,
                      keyboardType: TextInputType.name,
                      //최대 1줄
                      maxLines: 1,
                      obscureText: _pwState,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 4, 31, 56)),
                          hintText: "Please enter your password",
                          // 배경색  채우기
                          filled: true,
                          fillColor: Color.fromARGB(255, 224, 229, 252),
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
                                  width: 1,
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
                                  ))),
                    ),
                  ),
                  //error meassage
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                loginError();
                                //home 화면 가기
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginHome(),
                                    ));
                              },
                              child: const Text("log in"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ));
                                },
                                child: const Text("Sign In"))
                          ],
                        )
                      ],
                    ),
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
//id, pw 입력 안 하고 login 입력시
  loginError() {
    if (pwcontroller.text.isEmpty || idcontroller.text.isEmpty) {
      setState(() {
        //error unicode
        Hint = "\u26A0 Field is empty!";
      });
    } else {
      setState(() {
        Hint = "";
      });
    }
  }
}