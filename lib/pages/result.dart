import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/chart.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/mylist.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;
import 'package:sell_car_app/tab.dart';

class Result extends StatefulWidget {
  final int inputAge;
  final int inputMileage;
  final dynamic inputMpg;
  final dynamic inputEngineSize;
  final String inputFueltype;
  final String inputTransmission;
  final double errorValue;

  const Result({
    Key? key,
    required this.inputAge,
    required this.inputMileage,
    required this.inputMpg,
    required this.inputEngineSize,
    required this.inputFueltype,
    required this.inputTransmission,
    required this.errorValue,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String fueltype = '';
  String transmission = '';
  String automatic = '0';
  String semi_auto = '0';
  String manual = '0';
  String diesel = '0';
  String hybrid = '0';
  String petrol = '0';
  String pred = '';
  String range = '';
  double price = 0;
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    super.initState();
    carPredict();
  }

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
            const SizedBox(height: 50),
            const Text(
              'RESULT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'THE PRICE OF YOUR CAR IS PREDICTED TO BE $range. ARE YOU GOING BACK TO MAIN?',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
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
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    primary: const Color.fromARGB(255, 4, 31, 56)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chart(
                            inputAge: widget.inputAge,
                            inputMileage: widget.inputMileage,
                            inputFueltype: widget.inputFueltype,
                            inputTransmission: widget.inputTransmission),
                      ));
                },
                child: const Text('SEE CHARTS')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    primary: const Color.fromARGB(255, 4, 31, 56)),
                onPressed: () {
                  _showDialog(context);
                },
                child: const Text(' ADD TO LIST ')),
          ],
        ),
      ),
    );
  }

  // functions
  Future<bool> carPredict() async {
    var url = Uri.parse(
        "http://localhost:8080/Rserve/bmw1_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
            "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
    switch (Static.model) {
      // audi
      case 'a3':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/audi_a3_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'a4':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/audi_a4_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'q3':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/audi_q3_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      // vw
      case 'golf':
        if (widget.inputFueltype == 'Petrol') {
          petrol = '1';
        } else if (widget.inputFueltype == 'Diesel') {
          diesel = '1';
        } else {
          hybrid = '1';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/vw_golf_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputPetrol=$petrol&inputDiesel=$diesel&inputHybrid=$hybrid&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'polo':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/vw_polo_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'tiguan':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/vw_tiguan_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      // ford
      case 'fiesta':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/ford_fiesta_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'focus':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/ford_focus_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'kuga':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/ford_kuga_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      // benz
      case 'a class':
        if (widget.inputFueltype == 'Petrol') {
          petrol = '1';
        } else {
          diesel = '1';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/benz_a_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputPetrol=$petrol&inputDiesel=$diesel&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'c class':
        if (widget.inputFueltype == 'Petrol') {
          petrol = '1';
        } else if (widget.inputFueltype == 'Diesel') {
          diesel = '1';
        } else {
          hybrid = '1';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/benz_c_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputPetrol=$petrol&inputDiesel=$diesel&inputHybrid=$hybrid&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case 'e class':
        if (widget.inputFueltype == 'Petrol') {
          petrol = '1';
        } else if (widget.inputFueltype == 'Diesel') {
          diesel = '1';
        } else {
          hybrid = '1';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/benz_e_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputPetrol=$petrol&inputDiesel=$diesel&inputHybrid=$hybrid&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      // bmw
      case '1 series':
        print('bmw1');
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/bmw1_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case '2 series':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/bmw2_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      case '3 series':
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/bmw3_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;

      //default
      default:
        if (widget.inputFueltype == 'Petrol') {
          fueltype = '1';
        } else {
          fueltype = '0';
        }
        if (widget.inputTransmission == 'Automatic') {
          automatic = '1';
        } else if (widget.inputTransmission == 'Semi_Auto') {
          semi_auto = '1';
        } else {
          manual = '1';
        }
        url = Uri.parse(
            "http://localhost:8080/Rserve/bmw1_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
                "${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
    }
    var response = await http.get(url);

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      String result = JSON['result'];
      setState(() {
        pred = result;
        price = double.parse(pred);
        range =
            '£${(double.parse(pred) - widget.errorValue).round()}~£${(double.parse(pred) + widget.errorValue).round()}';
      });
    });
    return true;
  }

  Future<bool> addlist() async {
    bool error = true;

    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/sellcar_mylist_insert.jsp?inputId=${Static.id}&inputTitle=${title.text}&inputPrice=${price.round()}&inputBrand=" +
            "${Static.brand}&inputModel=${Static.model}&inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize=" +
            "${widget.inputEngineSize}&inputFueltype=${widget.inputFueltype}&inputTransmission=${widget.inputTransmission}&inputError=${widget.errorValue}");
    var response = await http.get(url);

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      String result = JSON['result'];
      if (result != 'OK') {
        error = false;
      }
    });
    return error;
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('ADD LIST'),
            content: const Text('PLEASE ENTER LIST TITLE'),
            actions: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: title,
                      decoration: InputDecoration(
                        labelText: 'INPUT TITLE',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color.fromARGB(255, 4, 31, 56)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (title.text.trim().isEmpty) {
                            titleSnackBar(context);
                          } else {
                            addlist();
                            _moveMylist(ctx);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 10),
                            primary: const Color.fromARGB(255, 4, 31, 56)),
                        child: const Text('ADD'),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 10),
                            primary: const Color.fromARGB(255, 4, 31, 56)),
                        child: const Text('CANCEL'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  _moveMylist(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('ALERT'),
            content: const Text(
                'LIST HAS BEEN ADDED. DO YOU WANT TO GO TO THE MYLIST?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Tabs()));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Mylist()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 10),
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    child: const Text('OK'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 10),
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    child: const Text('CANCEL'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  titleSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE WRITE TITLE'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
} // end


