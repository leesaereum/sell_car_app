import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sell_car_app/pages/chart.dart';
import 'package:sell_car_app/pages/result.dart';
import 'package:sell_car_app/static.dart';

class Mylist_Detail extends StatefulWidget {
  final String list_num;
  const Mylist_Detail({Key? key, required this.list_num}) : super(key: key);

  @override
  State<Mylist_Detail> createState() => _Mylist_DetailState();
}

class _Mylist_DetailState extends State<Mylist_Detail> {
  late List mylist;
  String title = "";
  String brand = "";
  String model = "";
  String price1 = "";
  String price2 = "";
  String age = "";
  String mileage = "";
  String mpg = "";
  String fueltype = "";
  String enginesize = "";
  String transmission = "";

  @override
  void initState() {
    super.initState();
    mylist = [];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/sellcar.png', width: 180),
          backgroundColor: Color.fromARGB(255, 4, 31, 56),
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 4, 31, 56),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "BRAND",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "MODEL",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "PRICE\n",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "CAR AGE",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "MILEAGE",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "MPG",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "ENGINESIZE",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "FUELTYPE",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "TRANSMISSION  ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 1,
                          height: 300,
                          color: Color.fromARGB(255, 4, 31, 56),
                        ),
                      ),
                      Column(
                        children: [
                          Text(brand,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(model,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text("$price1\n ~ $price2",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(age,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(mileage,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(mpg,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(enginesize,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(fueltype,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 13),
                          Text(transmission,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 4, 31, 56),
                  fixedSize: Size(250, 50)),
              onPressed: () {
                Static.brand = brand;
                Static.model = model;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chart(
                            inputAge: int.parse(age),
                            inputMileage: int.parse(mileage),
                            inputFueltype: fueltype,
                            inputTransmission: transmission)));
              },
              child: const Text(
                'GO TO SEE CHART',
                style: TextStyle(fontSize: 20),
              ),
            )
          ]),
        ));
  }

  getData() async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/sell_car/listdetail.jsp?list_num=${widget.list_num}");
    var response = await http.get(url);
    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      mylist = JSON['result'];
      title = mylist[0]['list_title'];
      brand = mylist[0]['list_brand'];
      model = mylist[0]['list_model'];
      price1 = (int.parse(mylist[0]['list_price']) -
              int.parse(mylist[0]['list_error']))
          .toString();
      price2 = (int.parse(mylist[0]['list_price']) +
              int.parse(mylist[0]['list_error']))
          .toString();
      mileage = mylist[0]['list_mileage'];
      mpg = mylist[0]['list_mpg'];
      enginesize = mylist[0]['list_enginesize'];
      transmission = mylist[0]['list_transmission'];
      fueltype = mylist[0]['list_fueltype'];
      age = mylist[0]['list_age'];
    });
  }
}
