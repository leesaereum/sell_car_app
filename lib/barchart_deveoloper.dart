import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sell_car_app/chart_series.dart';

class BarChartDeveloper extends StatelessWidget {
  final List<DeveloperSeries> data;
  final String content;

  const BarChartDeveloper({Key? key, required this.data, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTickFormatter =
        charts.BasicNumericTickFormatterSpec(((measure) => '£$measure'));
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                (content == "transmission")
                    ? const Text(
                        "Average Price by Transmission",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : const Text(
                        "Average Price by FuelType",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                Expanded(
                  child: charts.BarChart(
                    series,
                    primaryMeasureAxis: charts.NumericAxisSpec(
                        tickFormatterSpec: customTickFormatter),
                    animationDuration: const Duration(seconds: 1),
                    animate: true,
                    barRendererDecorator: charts.BarLabelDecorator<String>(
                      outsideLabelStyleSpec: const charts.TextStyleSpec(
                        fontSize: 10,
                      ),
                    ),
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
