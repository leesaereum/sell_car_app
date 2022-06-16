import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_deveoloper.dart';
import 'package:sell_car_app/chart_series.dart';

class Chart extends StatefulWidget {
  final int inputAge;
  final dynamic inputMileage;
  final dynamic inputMpg;
  final dynamic inputEngineSize;
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
  final List<DeveloperSeries> data = [];
  final dynamic price = 1000; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.add(DeveloperSeries(
        feature: widget.inputAge, 
        target: price, 
        chartColor: charts.ColorUtil.fromDartColor(Colors.green),),);

    data.add(DeveloperSeries(
        feature: widget.inputAge+5, 
        target: price, 
        chartColor: charts.ColorUtil.fromDartColor(Colors.red),),);

    data.add(DeveloperSeries(
        feature: widget.inputAge+10, 
        target: price, 
        chartColor: charts.ColorUtil.fromDartColor(Colors.green),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Chart"),
      ),
      body: Center(
        child: DeveloperChart(data: data),
      ),
    );
  }
}
