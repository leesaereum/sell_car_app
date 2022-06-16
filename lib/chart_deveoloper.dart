import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_series.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data; 

  const DeveloperChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
        id: "developers",
        data: data,
        // x-axis 
        domainFn: (DeveloperSeries series, _) => series.feature.toString(),
        // y-axis 
        measureFn: (DeveloperSeries series, _) => series.target,
        // individual color 
        colorFn: (DeveloperSeries  series, _) => series.chartColor
        )
    ];

    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text(
                  "Average Price",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: charts.BarChart(
                  series,
                  animationDuration: const Duration(seconds: 3),
                  animate: true,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}