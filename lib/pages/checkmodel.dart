import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/chechinfo.dart';

class CheckModel extends StatefulWidget {
  const CheckModel({Key? key}) : super(key: key);

  @override
  State<CheckModel> createState() => _CheckModelState();
}

class _CheckModelState extends State<CheckModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: const Color.fromARGB(255, 4, 31, 56),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              'CHOOSE MODEL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckInfo(),
                  )),
              child: Card(child: Image.asset('images/car.gif')),
            ),
          ],
        ),
      ),
    );
  }
}
