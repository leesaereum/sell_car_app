import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: const Color.fromARGB(255, 4, 31, 56),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
