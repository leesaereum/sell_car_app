import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/addcommunity.dart';
import 'package:sell_car_app/pages/detailcommunity.dart';
import 'package:sell_car_app/static.dart';

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
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
          actions: [
            IconButton(
              onPressed: (() {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Addcommunity(),
                      ));
              }), 
              icon: const Icon(Icons.add)
              ),
          ],
        ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: (() {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Detailcommunity(),
                      ));
              }),
              child: Card(
                color: Colors.grey[350],
                child: Row(
                  children: [
                    Text(
                      "${Static.nickname}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Text("Title is in here",
                    style: TextStyle(
                      fontSize: 25
                    ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
