import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/community.dart';
import 'package:sell_car_app/pages/login.dart';
import 'package:sell_car_app/pages/mylist.dart';
import 'package:sell_car_app/pages/mypage.dart';
import 'package:sell_car_app/pages/tips.dart';
import 'package:sell_car_app/static.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/car.gif"),
              radius: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (Static.id.isEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckHome(),
                      ));
                }
              },
              child: const Text("SEE MY CAR'S PRICE"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Hello [${Static.nickname}]!',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mypage(),
                      ));
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: const Text('MYPAGE'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mylist(),
                      ));
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.list),
                ),
                title: const Text('MYLIST'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Community(),
                      ));
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.library_books),
                ),
                title: const Text('COMMUNITY'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tips(),
                      ));
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.lightbulb),
                ),
                title: const Text('TIPS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
