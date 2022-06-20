import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_series.dart';

class ScatterChartDeveloper extends StatelessWidget {
  final List<DeveloperSeries> data;
  final List<DeveloperSeries> yourpricedata;
  final int minMileage;
  final int maxMileage;
  const ScatterChartDeveloper(
      {Key? key,
      required this.data,
      required this.minMileage,
      required this.maxMileage,
      required this.yourpricedata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTickFormatter =
        charts.BasicNumericTickFormatterSpec(((measure) => '£$measure'));
    List<charts.Series<DeveloperSeries, num>> series = [
      charts.Series(
          id: "Your Price",
          data: yourpricedata,
          domainFn: (DeveloperSeries series, _) => series.feature,
          // y-axis
          measureFn: (DeveloperSeries series, _) => series.target,
          // individual color
          colorFn: (DeveloperSeries series, _) =>
              charts.MaterialPalette.red.shadeDefault),
      charts.Series(
          id: "Others",
          data: data,
          // x-axis
          domainFn: (DeveloperSeries series, _) => series.feature,
          // y-axis
          measureFn: (DeveloperSeries series, _) => series.target,
          // individual color
          colorFn: (DeveloperSeries series, _) => series.chartColor),
    ];
    // return charts.BarChart(series, animate: true); // Version 1
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const Text(
                  'Price by Mileage',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: charts.ScatterPlotChart(
                    series,
                    animationDuration: const Duration(seconds: 1),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                        tickFormatterSpec: customTickFormatter),
                    domainAxis: charts.NumericAxisSpec(
                      tickProviderSpec:
                          const charts.BasicNumericTickProviderSpec(
                              zeroBound: false),
                      viewport: charts.NumericExtents(minMileage, maxMileage),
                    ),
                    animate: true,
                    behaviors: [
                      charts.ChartTitle(
                        '',
                        subTitle: 'Mileage(mile)',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea,
                      ),
                      charts.SeriesLegend(
                          position: charts.BehaviorPosition.bottom),
                    ],
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

