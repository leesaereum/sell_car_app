import 'package:charts_flutter/flutter.dart' as charts; 

class DeveloperSeries {
  late var feature; 
  late var target; 
  late charts.Color chartColor; 

  DeveloperSeries ({
    required this.feature,
    required this.target,
    required this.chartColor,
  });
}