import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late bool _clearState;
  late String errorText ="";
  late String errorTextColor = "";

  //textedingcontroller
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController pwagiancontroller = TextEditingController();
  //유효성 검사 
  GlobalKey<FormState> formkey =GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _clearState = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Form(
        key: formkey,
          child: Column(
            children: [
              //email
              Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: idcontroller,
                  //email 형식
                  keyboardType: TextInputType.emailAddress,
                  //최대 1줄
                  maxLines: 1,
                  
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
                  //style 
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 4, 31, 56)),
                    hintText: "Fill your Email",
                    // 배경색  채우기
                    filled: true,
                    fillColor: Color.fromARGB(255, 224, 229, 252),
                    //클릭할 떄 보이는 테두리
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            width: 1.5, color: Color.fromARGB(133, 64, 68, 90))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(48, 64, 68, 90))),
                  ),
                ),
              ),
             
              //pw
              Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: pwcontroller,
                    keyboardType: TextInputType.name,
                    //최대 1줄
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 4, 31, 56)),
                      hintText: "Fill your password",
                      // 배경색  채우기
                      filled: true,
                      fillColor: Color.fromARGB(255, 224, 229, 252),
                      //클릭할 떄 보이는 테두리
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(133, 64, 68, 90))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(48, 64, 68, 90))),
                    //텍스트필드 뒤에 아이콘 , 누르면 내용 지우기 
                    
                    //null // show nothing if field is empty 
                    ),
                  )),
                
              //pwagain
              Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: pwagiancontroller,
                    keyboardType: TextInputType.name,
                    //최대 1줄
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: "Password check",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 4, 31, 56)),
                      hintText: "Rewrite your passwrod",
                      // 배경색  채우기
                      filled: true,
                      fillColor: Color.fromARGB(255, 224, 229, 252),
                      //클릭할 떄 보이는 테두리
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(133, 64, 68, 90))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(48, 64, 68, 90))),
                    ),
                  )),
              Container(
                   padding: const EdgeInsets.only(left: 30.0, top: 1.0),
                child: Row(
                  children: <Widget> [
                    Text(errorText,
                    style: const TextStyle(
                      fontSize: 16.0,
                      //color: Colors.errorTextColor,
                    ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    emptyError();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const LoginHome(),
                    //     ));
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      
    );
  }

  //functions 
  emptyError() {
    //pw ,pwagain이 같을때 
    if(pwcontroller.text == pwagiancontroller.text) {
    setState(() {
      errorText = "Match your entered password";
      errorTextColor = "green[300]";
    });
    } // not same 
     else { 
      setState(() {
        errorText = "Not match your entered password";
      });
     }
  }
} //end