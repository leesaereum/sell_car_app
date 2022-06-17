import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mylist extends StatefulWidget {
  const Mylist({Key? key}) : super(key: key);

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SELL CAR'),
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 30),
          const Text(
            'MY LIST',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ])));
  }
}
