import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_car_app/pages/result.dart';

class CheckInfo extends StatefulWidget {
  const CheckInfo({Key? key}) : super(key: key);

  @override
  State<CheckInfo> createState() => _CheckInfoState();
}

class _CheckInfoState extends State<CheckInfo> {
  TextEditingController age = TextEditingController();
  TextEditingController mileage = TextEditingController();
  TextEditingController mpg = TextEditingController();
  TextEditingController enginesize = TextEditingController();
  TextEditingController fueltype = TextEditingController();
  TextEditingController transmission = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SELL CAR'),
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: age,
                    decoration: const InputDecoration(labelText: 'INPUT AGE'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: mileage,
                    decoration:
                        const InputDecoration(labelText: 'INPUT MILEAGE'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: mpg,
                    decoration: const InputDecoration(labelText: 'INPUT MPG'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: enginesize,
                    decoration:
                        const InputDecoration(labelText: 'INPUT ENGINESIZE'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: fueltype,
                    decoration:
                        const InputDecoration(labelText: 'INPUT FUELTYPE'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: TextField(
                    controller: transmission,
                    decoration:
                        const InputDecoration(labelText: 'INPUT TRANSMISSION'),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Result(),
                          ));
                    },
                    child: const Text(
                      'RESULT',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
