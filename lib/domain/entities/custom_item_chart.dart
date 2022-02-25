import 'package:equatable/equatable.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustomItemChart extends Equatable {
  const CustomItemChart({
    required this.bottom,
    required this.item,
    required this.barColor,
  });
  final String bottom;
  final double item;
  final charts.Color barColor;

  @override
  List<Object> get props => [
    bottom,
    item,
    barColor
  ];
}