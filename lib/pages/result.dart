import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/chart.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/mylist.dart';

class Result extends StatefulWidget {
  final int inputAge;
  final int inputMileage;
  final dynamic inputMpg;
  final dynamic inputEngineSize;
  final String inputFueltype;
  final String inputTransmission;
 
  const Result({Key? key,
  required this.inputAge,
    required this.inputMileage,
    required this.inputMpg,
    required this.inputEngineSize,
    required this.inputFueltype,
    required this.inputTransmission,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELL CAR'),
        backgroundColor: Color.fromARGB(255, 4, 31, 56),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'RESULT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 10),
                    primary: const Color.fromARGB(255, 4, 31, 56)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckHome(),
                      ));
                },
                child: const Text('CHECK AGAIN')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 10),
                    primary: const Color.fromARGB(255, 4, 31, 56)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chart(
                          inputAge: widget.inputAge, 
                          inputMileage: widget.inputMileage, 
                          inputMpg: widget.inputMpg, 
                          inputEngineSize: widget.inputEngineSize, 
                          inputFueltype: widget.inputFueltype, 
                          inputTransmission: widget.inputTransmission),
                      ));
                },
                child: const Text('SEE CHARTS')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 10),
                    primary: const Color.fromARGB(255, 4, 31, 56)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mylist(),
                      ));
                },
                child: const Text(' ADD TO LIST ')),
          ],
        ),
      ),
    );
  }
}
