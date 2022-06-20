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
  String transmissionName = '';
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

  @override
  void initState() {
    super.initState();
    switch (Static.model) {
      //audi
      case 'a3':
        minAge = 1;
        maxAge = 17;
        minMileage = 5;
        maxMileage = 152034;
        minMpg = 31;
        maxMpg = 83.1;
        minEngineSize = 1;
        maxEngineSize = 2.5;
        errorValue = 1375;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'a4':
        minAge = 1;
        maxAge = 16;
        minMileage = 10;
        maxMileage = 148000;
        minMpg = 22.8;
        maxMpg = 74.3;
        minEngineSize = 0;
        maxEngineSize = 4.2;
        errorValue = 1649;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'q3':
        minAge = 1;
        maxAge = 9;
        minMileage = 10;
        maxMileage = 120860;
        minMpg = 30.7;
        maxMpg = 62.8;
        minEngineSize = 0;
        maxEngineSize = 2.5;
        errorValue = 1431;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      //ford
      case 'fiesta':
        minAge = 1;
        maxAge = 12;
        minMileage = 10;
        maxMileage = 119902;
        minMpg = 40;
        maxMpg = 88;
        minEngineSize = 0;
        maxEngineSize = 2;
        errorValue = 667;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'focus':
        minAge = 1;
        maxAge = 15;
        minMileage = 1;
        maxMileage = 130000;
        minMpg = 30;
        maxMpg = 83;
        minEngineSize = 0;
        maxEngineSize = 2.5;
        errorValue = 794;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'kuga':
        minAge = 1;
        maxAge = 8;
        minMileage = 19;
        maxMileage = 190000;
        minMpg = 27;
        maxMpg = 64;
        minEngineSize = 0;
        maxEngineSize = 2.5;
        errorValue = 1087;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      //vw
      case 'golf':
        minAge = 1;
        maxAge = 20;
        minMileage = 1;
        maxMileage = 170000;
        minMpg = 32.8;
        maxMpg = 188.3;
        minEngineSize = 0;
        maxEngineSize = 2;
        errorValue = 999;
        fueltype = ['diesel', 'petrol', 'hybrid'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'polo':
        minAge = 1;
        maxAge = 15;
        minMileage = 1;
        maxMileage = 116000;
        minMpg = 35.8;
        maxMpg = 83.1;
        minEngineSize = 1;
        maxEngineSize = 2;
        errorValue = 652;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'tiguan':
        minAge = 1;
        maxAge = 13;
        minMileage = 19;
        maxMileage = 113000;
        minMpg = 30.1;
        maxMpg = 60.1;
        minEngineSize = 0;
        maxEngineSize = 2;
        errorValue = 1660;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      //benz
      case 'a class':
        minAge = 1;
        maxAge = 8;
        minMileage = 9;
        maxMileage = 103000;
        minMpg = 28.5;
        maxMpg = 80.7;
        minEngineSize = 0;
        maxEngineSize = 2.1;
        errorValue = 1028;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'c class':
        minAge = 1;
        maxAge = 8;
        minMileage = 1;
        maxMileage = 140000;
        minMpg = 23.5;
        maxMpg = 78.5;
        minEngineSize = 1.5;
        maxEngineSize = 6.2;
        errorValue = 4887;
        fueltype = ['diesel', 'petrol', 'hybrid'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case 'e class':
        minAge = 1;
        maxAge = 12;
        minMileage = 20;
        maxMileage = 92173;
        minMpg = 19.8;
        maxMpg = 72.4;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 3062;
        fueltype = ['diesel', 'petrol', 'hybrid'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      //bmw
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
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case '2 series':
        minAge = 1;
        maxAge = 6;
        minMileage = 9;
        maxMileage = 102900;
        minMpg = 32.5;
        maxMpg = 74.3;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1235;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
        break;
      case '3 series':
        minAge = 1;
        maxAge = 21;
        minMileage = 5;
        maxMileage = 162000;
        minMpg = 27.7;
        maxMpg = 74.3;
        minEngineSize = 0;
        maxEngineSize = 3;
        errorValue = 1231;
        fueltype = ['diesel', 'petrol'];
        transmission = ['automatic', 'manual', 'semi-auto'];
        fuelName = fueltype[0];
        transmissionName = transmission[0];
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
                  height: 20,
                ),
                const Text(
                  'INSERT INFO',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    const Text(
                      'FUELTYPE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fueltype.length == 2
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      fuelName = fueltype[0];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                      color: fuelName == fueltype[0]
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
                                  onTap: () {
                                    setState(() {
                                      fuelName = fueltype[0];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                      color: fuelName == fueltype[0]
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
                                  onTap: () {
                                    setState(() {
                                      fuelName = fueltype[1];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                      color: fuelName == fueltype[1]
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
                                  onTap: () {
                                    setState(() {
                                      fuelName = fueltype[1];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                      color: fuelName == fueltype[1]
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
                                  onTap: () {
                                    setState(() {
                                      fuelName = fueltype[2];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                      color: fuelName == fueltype[2]
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
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Text(
                      'TRANSMISSION',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          transmission.length == 2
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      transmissionName = transmission[0];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                      color: transmissionName == transmission[0]
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
                                  onTap: () {
                                    setState(() {
                                      transmissionName = transmission[0];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                      color: transmissionName == transmission[0]
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
                                  onTap: () {
                                    setState(() {
                                      transmissionName = transmission[1];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                      color: transmissionName == transmission[1]
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
                                  onTap: () {
                                    setState(() {
                                      transmissionName = transmission[1];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                      color: transmissionName == transmission[1]
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
                                  onTap: () {
                                    setState(() {
                                      transmissionName = transmission[2];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                      color: transmissionName == transmission[2]
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
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
                                    inputTransmission: transmissionName,
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
