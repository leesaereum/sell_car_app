import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  TextEditingController id = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  'MYPAGE',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextField(
                    controller: id,
                    decoration: const InputDecoration(labelText: 'ID'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextField(
                    controller: nickname,
                    decoration: const InputDecoration(labelText: 'NICKNAME'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(labelText: 'PASSWORD'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'REVISE',
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(width: 50),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'RESIGN',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
