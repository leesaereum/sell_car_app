import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/checkmodel.dart';

class CheckBrand extends StatefulWidget {
  const CheckBrand({Key? key}) : super(key: key);

  @override
  State<CheckBrand> createState() => _CheckBrandState();
}

class _CheckBrandState extends State<CheckBrand> {
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
              'CHOOSE BRAND',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckModel(),
                  )),
              child: Card(child: Image.asset('images/car.gif')),
            )
          ],
        ),
      ),
    );
  }
}
