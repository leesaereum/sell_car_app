import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_series.dart';

class BarChartCountDeveloper extends StatelessWidget {
  final List<DeveloperSeries> data;

  const BarChartCountDeveloper({Key? key, required this.data})
      : super(key: key);

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
        colorFn: (DeveloperSeries series, _) => series.chartColor,
        labelAccessorFn: (DeveloperSeries series, _) =>
            series.target.toString(),
      ),
    ];

    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                const Text(
                  "The Number of Cars Registered",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: charts.BarChart(
                    series,
                    animationDuration: const Duration(seconds: 1),
                    animate: true,
                    barRendererDecorator: charts.BarLabelDecorator<String>(
                      outsideLabelStyleSpec: const charts.TextStyleSpec(
                        fontSize: 7,
                      ),
                    ),
                    behaviors: [
                      charts.ChartTitle(
                        '',
                        subTitle: 'Car Age',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea,
                      ),
                    ],
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
