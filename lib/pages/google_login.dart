import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
class GoogleLogin extends StatefulWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  final _formkey =GlobalKey<FormState>();

  //...
  //firebaseauth 인증 필수 클래스 
     FirebaseAuth auth =FirebaseAuth.instance;
   GoogleSignIn googleSignIn = GoogleSignIn();
  
  // //구글 로그인 화면 나타남 
  // //로그인한 유저 정보 받아냄 
 GoogleSignInAccount account = await googleSignIn.signIn();
 GoogleSignInAuthentication authentication = await account.authentication;


  // //googleauth provider를 통해 최종인증한 유저 정보 가져오기 
  AuthCredential credential = GoogleAuthProvider.getCredential(
       idToken : authentication.idToken,
       accessToken : authentication.accessToken
     );
     
     AuthResult authResult = await auth.signInWithCredential(credential);
     FirebaseUser user = authResult.user;
//서버 통신시 
//FirebaseAuth auth = FirebaseAuth.instance;
//FirebaseUser user = await auth.getCurrentUser();

//IdTokenResult idTokenResult = await user.getIdToken();





  ///...




  //firebase auth
  late String _password;
  late String _email;
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
    return Scaffold(
      appBar:AppBar(
        title: Image.asset("../images/sellcar.png",width: 180,),
        backgroundColor: const Color.fromARGB(255, 4, 31, 56),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget> [
              const Text("google login",
              style : TextStyle(fontSize: 20),
              ),
              //id -email 
              TextFormField(
                //update 지역변수 
                onSaved: (value) => _email = value ,
                controller: idController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Please insert your email",
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              //pw
              TextFormField(
                onSaved: (value) => _password = value ,
                controller: pwController,
                keyboardType: TextInputType.text,
                  //아이콘 누르면 비번 보이게 ,누르기 전 안보임 
                obscureText: _pwState,
                decoration:  InputDecoration(
                  hintText: "Please insert your password",
                  //텍스트필드 앞에 아이콘
                  prefixIcon: Icon(Icons.lock_outline_rounded),
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
                    //true : false 
                    ),
                    )

                    
                ),
              ),
              const SizedBox(height: 20.0,),
              RaisedButton(child: Text("LOGIN"),
                onPressed: () async{
                final form = _formkey.currentState;
                //form.save();
                //if(form.validate()) {
                  //var result =await Provider.of<AuthService>(context);
                }
              //},
              )
            ],
          ),
        ),
      ),
    );
  }
  //functions
  

  

} //end 