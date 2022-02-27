import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/custom_item_chart.dart';

class CustomItemChartModel extends CustomItemChart {
  const CustomItemChartModel({
    required this.circuit,
    required this.item,
    required this.barColor,
  }): super(
    circuit: circuit,
    item: item,
    barColor: barColor
  );
  final Circuit circuit;
  final double item;
  final charts.Color barColor;
}