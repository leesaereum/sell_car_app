import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/login.dart';
import 'package:sell_car_app/static.dart';
import 'package:sell_car_app/tab.dart';

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
        primaryColor: const Color.fromARGB(255, 4, 31, 56),
        backgroundColor: const Color.fromARGB(255, 4, 31, 56),
      ),
      debugShowCheckedModeBanner: false,
      home: const Tabs(),
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
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 4, 31, 56)),
              onPressed: () {
                if (Static.id.isEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                 } 
                else {
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
    );
  }
}
