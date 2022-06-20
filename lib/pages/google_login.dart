
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sell_car_app/provider/google_sign_in.dart';

  class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

Future<UserCredential> signInWithGoogle() async {

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

  //password
  // 비번 visible= 안보임이 초기상태
  bool _pwState =true;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();


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
        appBar:AppBar(
          title: Image.asset("images/sellcar.png",width: 180,),
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: <Widget> [
                  const Text("Welcome to SELL CAR ",
                  style : TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //id -email 
                  TextFormField(
                    controller: idController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Please enter your email",
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                  ),
                  //pw
                  TextFormField(
                    controller: pwController,
                    keyboardType: TextInputType.text,
                      //아이콘 누르면 비번 보이게 ,누르기 전 안보임 
                    obscureText: _pwState,
                    decoration:  InputDecoration(
                      hintText: "Please enter your password",
                      //텍스트필드 앞에 아이콘
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      //텍스트필드 뒤에 아이콘 
                      suffixIcon: _pwState ?
                      //true - pw 안보이게 
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _pwState =!_pwState;
                          });
                        }, 
                        icon: const Icon(Icons.lock,
                        color: Colors.grey ,
                        //true : false 
                        ),
                        ) :
                        //false - pw 보이게 
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _pwState =!_pwState;
                          });
                        }, 
                        icon: const Icon(Icons.remove_red_eye,
                        color: Colors.black87 ,
                        ),
                        )
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  ElevatedButton(
                    onPressed:() {
                      //
                    }, 
                   child: const Text("Log In",
                   style: TextStyle(
                      fontSize: 19
                    ),
                   ),
                   style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 4, 31, 56),
                   ),
                   ),
                  const SizedBox(height: 70.0,),
                  ElevatedButton.icon(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                      provider.googleLogin();
                      //
                    },
                    icon: const Icon(Icons.email_rounded,
                    size: 32,
                    ),
                    label: const Text("Sign Up with Email",
                    style: TextStyle(
                      fontSize: 19
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 4, 31, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(250, 45),
                      ) 
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ElevatedButton.icon(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                      provider.googleLogin();
                      //
                    },
                    icon: Image.asset("images/googlelogo.png",
                    height: 32.0,
                    ),
                    label: const Text("Sign Up with Google",
                    style: TextStyle(
                      fontSize: 19
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 4, 31, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(250, 45),
                      ) 
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
  

 

} //end 