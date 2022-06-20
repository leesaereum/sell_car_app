import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_series.dart';

class LineChartDeveloper extends StatelessWidget {
  final List<DeveloperSeries> data;
  final int minAge;
  final int maxAge;

  const LineChartDeveloper(
      {Key? key,
      required this.data,
      required this.minAge,
      required this.maxAge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTickFormatter =
        charts.BasicNumericTickFormatterSpec(((measure) => '£$measure'));
    List<charts.Series<DeveloperSeries, num>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.feature,
          measureFn: (DeveloperSeries series, _) => series.target,
          colorFn: (DeveloperSeries series, _) => series.chartColor)
    ];
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                const Text(
                  'Average Price by Car Age',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: charts.LineChart(
                    series,
                    animationDuration: const Duration(seconds: 1),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                        tickFormatterSpec: customTickFormatter),
                    domainAxis: charts.NumericAxisSpec(
                      tickProviderSpec:
                          const charts.BasicNumericTickProviderSpec(
                              zeroBound: false),
                      viewport: charts.NumericExtents(minAge, maxAge),
                    ),
                    animate: true,
                    behaviors: [
                      charts.ChartTitle('',
                      subTitle: 'Car Age',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                      
                      ),
                    ],
                    defaultRenderer: charts.LineRendererConfig(includePoints: true),
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
