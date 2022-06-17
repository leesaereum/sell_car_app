import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/chart.dart';
import 'package:sell_car_app/pages/check.dart';
import 'package:sell_car_app/pages/mylist.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  final int inputAge;
  final int inputMileage;
  final dynamic inputMpg;
  final dynamic inputEngineSize;
  final String inputFueltype;
  final String inputTransmission;
  final double errorValue;

 
  const Result({Key? key,
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
  String automatic= '0';
  String semi_auto = '0';
  String manual = '0';
  String pred='';
  String range='';

  @override
  void initState() {
    super.initState();
    irisPredict();
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
            const SizedBox(height: 30),
            const Text(
              'RESULT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('THE PRICE OF YOUR CAR IS PREDICTED TO BE $range. ARE YOU GOING BACK TO MAIN?',
              style: TextStyle(
                fontSize: 20
              ),
              ),
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
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         fixedSize: const Size(130, 10),
            //         primary: const Color.fromARGB(255, 4, 31, 56)),
            //     onPressed: () {
            //       // print(widget.inputAge);
            //       // print(widget.inputMileage);
            //       // print(widget.inputMpg);
            //       // print(widget.inputEngineSize);
            //       // print(widget.inputFueltype);
            //       // print(widget.inputTransmission);
            //       // print(Static.model);
            //       irisPredict();
            //     },
            //     child: const Text('Test')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 10),
                    primary: const Color.fromARGB(255, 4, 31, 56)),
                onPressed: () {
                  print(widget.inputAge);
                  print(widget.inputMileage);
                  print(widget.inputMpg);
                  print(widget.inputEngineSize);
                  print(widget.inputFueltype);
                  print(widget.inputTransmission);
                  print(Static.model);
                  // irisPredict();
                },
                child: const Text('Test Name')),
          ],
        ),
      ),
    );
  }


  // functions
  Future<bool> irisPredict() async {
      var url = Uri.parse(
        "http://localhost:8080/Rserve/bmw1_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize="
        +"${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
    switch(Static.model){
      case '1 series':
        if(widget.inputFueltype=='petrol'){
          fueltype='1';
        }else{
          fueltype='0';
        }
        if(widget.inputTransmission=='automatic'){
          automatic='1';
        }else if(widget.inputTransmission=='semi-auto'){
          semi_auto='1';
        }else{
          manual='1';
        }
        url = Uri.parse(
        "http://localhost:8080/Rserve/bmw1_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize="
        +"${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
      default:
        if(widget.inputFueltype=='petrol'){
          fueltype='1';
        }else{
          fueltype='0';
        }
        if(widget.inputTransmission=='automatic'){
          automatic='1';
        }else if(widget.inputTransmission=='semi-auto'){
          semi_auto='1';
        }else{
          manual='1';
        }
        url = Uri.parse(
        "http://localhost:8080/Rserve/bmw1_response.jsp?inputAge=${widget.inputAge}&inputMileage=${widget.inputMileage}&inputMpg=${widget.inputMpg}&inputEngineSize="
        +"${widget.inputEngineSize}&inputFueltype=${fueltype}&inputAutomatic=$automatic&inputManual=$manual&inputSemiAuto=$semi_auto");
        break;
        

    }
    var response = await http.get(url);

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      String result = JSON['result'];
      setState(() {
        pred = result;
        range='£${(double.parse(pred)-widget.errorValue).round()}~£${(double.parse(pred)+widget.errorValue).round()}';
      });
    });
    return true;
  }

}