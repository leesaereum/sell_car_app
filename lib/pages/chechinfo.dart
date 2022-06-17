import 'package:flutter/material.dart';
import 'package:sell_car_app/pages/result.dart';
import 'package:sell_car_app/static.dart';

class CheckInfo extends StatefulWidget {
  const CheckInfo({Key? key}) : super(key: key);

  @override
  State<CheckInfo> createState() => _CheckInfoState();
}

class _CheckInfoState extends State<CheckInfo> {
  List<String> fueltype = [];
  List<String> transmission = [];
  String fuelName = '';
  String transmissionName= '';
  // int fueltypeIndex = 0;
  // int transmissionIndex = 0;
  late double minAge;
  late double minMileage;
  late double minMpg;
  late double minEngineSize;
  late double maxAge;
  late double maxMileage;
  late double maxMpg;
  late double maxEngineSize;
  late double errorValue;
  TextEditingController age = TextEditingController();
  TextEditingController mileage = TextEditingController();
  TextEditingController mpg = TextEditingController();
  TextEditingController enginesize = TextEditingController();
  // TextEditingController fueltype = TextEditingController();
  // TextEditingController transmission = TextEditingController();

  @override
  void initState() {
    super.initState();
    // minAge = 1;
    // maxAge = 12;
    // minMileage = 10;
    // maxMileage = 108000;
    // minMpg = 32.5;
    // maxMpg = 83.1;
    // minEngineSize = 0;
    // maxEngineSize = 3;
    // errorValue = 1015;
    // fueltype = ['diesel', 'petrol'];
    // transmission = ['automatic', 'manual', 'semi-auto'];
    switch (Static.model) {
      case 'a3':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'a4':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'q3':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'fiesta':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'focus':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'kuga':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'golf':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'polo':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'tiguan':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'a class':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'c class':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case 'e class':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case '1 series':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case '2 series':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
      case '3 series':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 108000;
        minMpg = 32.5;
        maxMpg = 83.1;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1015;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName=fueltype[0];
        transmissionName=transmission[0];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                    decoration: InputDecoration(
                      labelText: 'INPUT AGE ($minAge~$maxAge)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: mileage,
                    decoration: InputDecoration(
                      labelText: 'INPUT MILEAGE ($minMileage~$maxMileage)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: mpg,
                    decoration: InputDecoration(
                      labelText: 'INPUT MPG ($minMpg~$maxMpg)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: enginesize,
                    decoration: InputDecoration(
                      labelText:
                          'INPUT ENGINESIZE ($minEngineSize~$maxEngineSize)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 4, 31, 56)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const Text('FUELTYPE'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        fueltype.length == 2
                            ? GestureDetector(
                              onTap: (){
                                setState(() {
                                  fuelName=fueltype[0];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: fuelName ==
                                                fueltype[0]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 165,
                                  child: Center(child: Text(fueltype[0])),
                                ),
                            )
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  fuelName=fueltype[0];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: fuelName ==
                                                fueltype[0]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 110,
                                  child: Center(child: Text(fueltype[0])),
                                ),
                            ),
                        fueltype.length == 2
                            ? GestureDetector(
                              onTap: (){
                                setState(() {
                                  fuelName=fueltype[1];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: fuelName ==
                                                fueltype[1]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 165,
                                  child: Center(child: Text(fueltype[1])),
                                ),
                            )
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  fuelName=fueltype[1];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: fuelName ==
                                                fueltype[1]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 110,
                                  child: Center(child: Text(fueltype[1])),
                                ),
                            ),
                        fueltype.length == 2
                            ? const SizedBox(
                                height: 40,
                                width: 0,
                              )
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  fuelName=fueltype[2];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: fuelName ==
                                                fueltype[2]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 110,
                                  child: Center(child: Text(fueltype[2])),
                                ),
                            ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Text('TRANSMISSION'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        transmission.length == 2
                            ? GestureDetector(
                              onTap: (){
                                setState(() {
                                  transmissionName=transmission[0];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: transmissionName ==
                                                transmission[0]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 165,
                                  child: Center(child: Text(transmission[0])),
                                ),
                            )
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  transmissionName=transmission[0];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: transmissionName ==
                                                transmission[0]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 110,
                                  child: Center(child: Text(transmission[0])),
                                ),
                            ),
                        transmission.length == 2
                            ? GestureDetector(
                              onTap: (){
                                setState(() {
                                  transmissionName=transmission[1];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: transmissionName ==
                                                transmission[1]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 165,
                                  child: Center(child: Text(transmission[1])),
                                ),
                            )
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  transmissionName=transmission[1];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: transmissionName ==
                                                transmission[1]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 110,
                                  child: Center(child: Text(transmission[1])),
                                ),
                            ),
                        transmission.length == 2
                            ? const SizedBox(
                                height: 40,
                                width: 0,
                              )
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  transmissionName=transmission[2];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: transmissionName ==
                                                transmission[2]
                                            ? Colors.amber
                                            : Color.fromARGB(255, 4, 31, 56),
                                        width: 3,
                                      )),
                                  height: 40,
                                  width: 110,
                                  child: Center(child: Text(transmission[2])),
                                ),
                            ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 4, 31, 56)),
                    onPressed: () {
                      if (age.text.trim().isEmpty ||
                          mileage.text.trim().isEmpty ||
                          mpg.text.trim().isEmpty ||
                          enginesize.text.trim().isEmpty) {
                        nullSnackBar(context);
                      } else if (age.text.split('.').length - 1 > 1 ||
                          mileage.text.split('.').length - 1 > 1 ||
                          mpg.text.split('.').length - 1 > 1 ||
                          enginesize.text.split('.').length - 1 > 1) {
                        pointSnackBar(context);
                      } else if (double.parse(age.text) < minAge ||
                          double.parse(age.text) > maxAge) {
                        ageSnackBar(context);
                      } else if (double.parse(mileage.text) < minMileage ||
                          double.parse(mileage.text) > maxMileage) {
                        mileageSnackBar(context);
                      } else if (double.parse(mpg.text) < minMpg ||
                          double.parse(mpg.text) > maxMpg) {
                        mpgSnackBar(context);
                      } else if (double.parse(enginesize.text) <
                              minEngineSize ||
                          double.parse(enginesize.text) > maxEngineSize) {
                        engineSnackBar(context);
                      } else {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(
                                    inputAge: int.parse(age.text),
                                    inputMileage: int.parse(mileage.text),
                                    inputMpg: mpg.text,
                                    inputEngineSize: enginesize.text,
                                    inputFueltype: fuelName,
                                    inputTransmission:
                                        transmissionName,
                                    errorValue: errorValue)));
                      }
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

  nullSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE FILL IN ALL BLANKS'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  pointSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE ENTER NUMBER CORRECTLY'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  ageSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE WRITE AGE AGAIN'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
  mileageSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE WRITE MILEAGE AGAIN'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
  mpgSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE WRITE MPG AGAIN'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
  engineSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PLEASE WRITE ENGINESIZE AGAIN'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
}
