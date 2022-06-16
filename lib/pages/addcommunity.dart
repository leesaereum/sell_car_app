import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Addcommunity extends StatefulWidget {
  const Addcommunity({Key? key}) : super(key: key);

  @override
  State<Addcommunity> createState() => _AddcommunityState();
}

class _AddcommunityState extends State<Addcommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('SELL CAR'),
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
        ),
      body: const Text("ADD"),
    );
  }
}