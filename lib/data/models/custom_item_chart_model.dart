import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flxtech/domain/entities/custom_item_chart.dart';

class CustomItemChartModel extends CustomItemChart {
  const CustomItemChartModel({
    required this.bottom,
    required this.item,
    required this.barColor,
  }): super(
    bottom: bottom,
    item: item,
    barColor: barColor
  );
  final String bottom;
  final double item;
  final charts.Color barColor;
}