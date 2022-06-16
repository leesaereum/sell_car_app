import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detailcommunity extends StatefulWidget {
  const Detailcommunity({Key? key}) : super(key: key);

  @override
  State<Detailcommunity> createState() => _DetailcommunityState();
}

class _DetailcommunityState extends State<Detailcommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('SELL CAR'),
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
        ),
      body: const Text("Detail")
    );
  }
}