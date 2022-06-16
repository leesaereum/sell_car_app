import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/signin.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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
                const SizedBox(height: 100),
                const Text(
                  'LOG-IN',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: TextField(
                    controller: id,
                    decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: 'Please insert your Email'),
                    keyboardType :TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 50),
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_clock_rounded),
                    hintText: 'Please insert your Password'),
                    keyboardType :TextInputType.text,
                    obscureText: true,       //비번 입력시 안 보이게 
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 33, 98, 159)),
                  onPressed: () {},
                  child: const Text(
                    ' LOGIN ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signin(),
                          ));
                    },
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 20),
                    )),

                    // Alert Box
         
              ],
            ),
          ),
        ),
      ),
    );
  }

}