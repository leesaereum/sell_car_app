import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_series.dart';

class PieChartDeveloper extends StatelessWidget {
  final List<DeveloperSeries> data;
  final String content; 

  const PieChartDeveloper({Key? key, required this.data, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          labelAccessorFn: (DeveloperSeries series, _) => series.feature,
          domainFn: (DeveloperSeries series, _) => series.feature,
          measureFn: (DeveloperSeries series, _) => series.target,
          colorFn: (DeveloperSeries series, _) => series.chartColor)
    ];
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                (content == "transmission") ? 
                const Text(
                  'PieChart of Transmission',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, 
                  ),
                )
                : 
                const Text(
                  'PieChart of FuelType',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, 
                  ),
                ),

                Expanded(
                  child: charts.PieChart<String>(
                    series,
                    animationDuration: const Duration(seconds: 1),
                    defaultRenderer: charts.ArcRendererConfig(
                        customRendererId: 'novoId',
                        arcWidth: 100,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                             outsideLabelStyleSpec: const charts.TextStyleSpec(
                              fontSize: 12, 
                             ),
                             ),
                        ]),
                    animate: true,
                   
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
