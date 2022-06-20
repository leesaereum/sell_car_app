import 'dart:convert';
import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/barchart_count_deveoloper.dart';
import 'package:sell_car_app/barchart_deveoloper.dart';
import 'package:sell_car_app/chart_series.dart';
import 'package:sell_car_app/linechart_developer.dart';
import 'package:sell_car_app/piechart_developer.dart';
import 'package:sell_car_app/scatterchart_developer.dart';
import 'package:sell_car_app/static.dart';
import 'package:http/http.dart' as http;

class Chart extends StatefulWidget {
  final int inputAge;
  final int inputMileage;
  final double inputMpg;
  final double inputEngineSize;
  final String inputFueltype;
  final String inputTransmission;

  const Chart({
    Key? key,
    required this.inputAge,
    required this.inputMileage,
    required this.inputMpg,
    required this.inputEngineSize,
    required this.inputFueltype,
    required this.inputTransmission,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final int predictedprice = 17000; // 임시로 만든 예측 가격 값
  final String model = Static.model; // 모델명
  final _valueList = [
    'MILEAGE',
    'CAR AGE',
    'FUELTYPE',
    'TRANSMISSION'
  ]; // DropDownButton List
  late String selectedValue; // DrowDown 선택값
  late List jsonData = []; // db jsondata 리스트
  String jspUrl = ""; // db 가져오는 jsp url 주소
  late List<DeveloperSeries> pricedata = []; // 차트 그릴 때 쓰는 data 리스트
  late List<DeveloperSeries> countdata = [];
  late List<DeveloperSeries> mileagedata = [];
  late List<DeveloperSeries> yourpricedata = [];
  late List<int> agelist = [];
  late List<int> mileagelist = [];

  @override
  void initState() {
    super.initState();
    jsonData = [];
    pricedata = [];
    countdata = [];
    mileagedata = [];
    agelist = [];
    mileagelist = [];
    selectedValue = 'MILEAGE';
    getJsonData(selectedValue);
    buildChart(selectedValue);
  }

// 화면 그림
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 31, 56),
          title: Image.asset(
            "images/sellcar.png",
            width: 180,
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              // Dropdown Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CONTENT OF CHART : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    value: selectedValue,
                    items: _valueList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                        jsonData = [];
                        pricedata = [];
                        countdata = [];
                        mileagedata = [];
                        agelist = [];
                        mileagelist = [];
                        getJsonData(selectedValue);
                      });
                    },
                  ),
                ],
              ),
              // ChartDeveloper
              buildChart(selectedValue)
            ],
          ),
        ),
      ),
    );
  }

// Functions
  // Desc: db 데이터 가져오는 함수
  Future<bool> getJsonData(String selectedValue) async {
    if (selectedValue == 'CAR AGE') {
      jspUrl =
          'http://localhost:8080/Flutter/sell_car/query_age_price.jsp?model=$model';
    } else if (selectedValue == 'TRANSMISSION') {
      jspUrl =
          'http://localhost:8080/Flutter/sell_car/query_transmission_price.jsp?model=$model';
    } else if (selectedValue == 'FUELTYPE') {
      jspUrl =
          'http://localhost:8080/Flutter/sell_car/query_fueltype_price.jsp?model=$model';
    } else if (selectedValue == 'MILEAGE') {
      jspUrl =
          'http://localhost:8080/Flutter/sell_car/query_mileage_price.jsp?model=$model&mileage=${widget.inputMileage}&age=${widget.inputAge}';
    }
    var url = Uri.parse(jspUrl);
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      // - 키 값 이용해서 안쪽 데이터에 접근
      List result = dataConvertedJSON['result'];
      jsonData.addAll(result);
      chartData(selectedValue);
    });
    return true;
  }

  // Desc: db에서 가져온 데이터로 차트 그릴 리스트 만드는 함수
  chartData(selectedValue) {
    if (selectedValue == 'CAR AGE') {
      for (int i = 0; i < jsonData.length; i++) {
        pricedata.add(
          DeveloperSeries(
            feature: int.parse(jsonData[i]['age']),
            target: int.parse(jsonData[i]['price']),
            chartColor: (int.parse(jsonData[i]['age']) ==
                    widget.inputAge) //컬러 재설정 해야함!!!
                ? charts.ColorUtil.fromDartColor(Colors.red)
                : charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
        countdata.add(
          DeveloperSeries(
            feature: jsonData[i]['age'],
            target: int.parse(jsonData[i]['count']),
            chartColor: (int.parse(jsonData[i]['age']) ==
                    widget.inputAge) //컬러 재설정 해야함!!!
                ? charts.ColorUtil.fromDartColor(Colors.red)
                : charts.ColorUtil.fromDartColor(Colors.grey),
          ),
        );
        agelist.add(int.parse(jsonData[i]['age']));
      }
      buildChart(selectedValue);
    } else if (selectedValue == 'TRANSMISSION') {
      for (int i = 0; i < jsonData.length; i++) {
        pricedata.add(
          DeveloperSeries(
            feature: jsonData[i]['transmission'],
            target: int.parse(jsonData[i]['price']),
            chartColor:
                (jsonData[i]['transmission'] == widget.inputTransmission)
                    ? charts.ColorUtil.fromDartColor(Colors.red)
                    : charts.ColorUtil.fromDartColor(Colors.grey),
          ),
        );
        countdata.add(
          DeveloperSeries(
            feature: jsonData[i]['transmission'],
            target: int.parse(jsonData[i]['count']),
            chartColor:
                (jsonData[i]['transmission'] == widget.inputTransmission)
                    ? charts.ColorUtil.fromDartColor(Colors.red)
                    : charts.ColorUtil.fromDartColor(Colors.grey),
          ),
        );
      }
      buildChart(selectedValue);
    } else if (selectedValue == 'FUELTYPE') {
      for (int i = 0; i < jsonData.length; i++) {
        pricedata.add(
          DeveloperSeries(
            feature: jsonData[i]['fuelType'],
            target: int.parse(jsonData[i]['price']),
            chartColor: (jsonData[i]['fuelType'] == widget.inputFueltype)
                ? charts.ColorUtil.fromDartColor(Colors.red)
                : charts.ColorUtil.fromDartColor(Colors.grey),
          ),
        );
        countdata.add(
          DeveloperSeries(
            feature: jsonData[i]['fuelType'],
            target: int.parse(jsonData[i]['count']),
            chartColor: (jsonData[i]['fuelType'] == widget.inputFueltype)
                ? charts.ColorUtil.fromDartColor(Colors.red)
                : charts.ColorUtil.fromDartColor(Colors.grey),
          ),
        );
      }
      buildChart(selectedValue);
    } else if (selectedValue == 'MILEAGE') {
      for (int i = 0; i < jsonData.length; i++) {
        mileagedata.add(
          DeveloperSeries(
              feature: int.parse(jsonData[i]['mileage']),
              target: int.parse(jsonData[i]['price']),
              chartColor: charts.ColorUtil.fromDartColor(Colors.blue)),
        );
        mileagelist.add(int.parse(jsonData[i]['mileage']));
      }
      yourpricedata.add(
        DeveloperSeries(
          feature: widget.inputMileage,
          target: predictedprice,
          chartColor: charts.ColorUtil.fromDartColor(Colors.red),
        ),
      );
      buildChart(selectedValue);
    }
  }

  // 차트 그리는 함수
  buildChart(selectedValue) {
    if (selectedValue == 'CAR AGE') {
      return Column(
        children: [
          LineChartDeveloper(
              data: pricedata,
              minAge: agelist.isEmpty
                  ? 0
                  : agelist.reduce(
                      (value, element) => value < element ? value : element),
              maxAge: agelist.isEmpty
                  ? 15
                  : agelist.reduce(
                      (value, element) => value > element ? value : element)),
          BarChartCountDeveloper(data: countdata),
        ],
      );
    } else if (selectedValue == 'TRANSMISSION') {
      return Column(
        children: [
          BarChartDeveloper(data: pricedata, content: "transmission"),
          PieChartDeveloper(data: countdata, content: "transmission")
        ],
      );
    } else if (selectedValue == 'FUELTYPE') {
      return Column(
        children: [
          BarChartDeveloper(data: pricedata, content: "fueltype"),
          PieChartDeveloper(data: countdata, content: "fueltype"),
        ],
      );
    } else if (selectedValue == 'MILEAGE') {
      return Column(
        children: [
          ScatterChartDeveloper(
            data: mileagedata,
            minMileage: mileagelist.isEmpty
                ? 0
                : mileagelist.reduce(
                    (value, element) => value < element ? value : element),
            maxMileage: mileagelist.isEmpty
                ? 40000
                : mileagelist.reduce(
                    (value, element) => value > element ? value : element),
            yourpricedata: yourpricedata,
          ),
        ],
      );
    }
  }
} // End
