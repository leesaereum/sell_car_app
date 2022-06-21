import 'package:flutter/material.dart';

class Deletecommunity extends StatefulWidget {
  const Deletecommunity({Key? key}) : super(key: key);

  @override
  State<Deletecommunity> createState() => _DeletecommunityState();
}

class _DeletecommunityState extends State<Deletecommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "./images/sellcar.png",
          width: 180,
        ),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
    );
  }
}