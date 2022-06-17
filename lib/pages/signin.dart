import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController id = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController checkpassword = TextEditingController();
  bool invisible = true;
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                    child: TextField(
                      controller: id,
                      decoration: const InputDecoration(labelText: 'ID'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: TextField(
                      controller: nickname,
                      decoration: const InputDecoration(labelText: 'NICKNAME'),
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
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              invisible = !invisible;
                            });
                          },
                          child: Icon(invisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 50),
                    child: TextField(
                      controller: checkpassword,
                      decoration:
                          const InputDecoration(labelText: 'CHECK PASSWORD'),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 4, 31, 56)),
                      onPressed: () {},
                      child: const Text(
                        'COMPLETE',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
