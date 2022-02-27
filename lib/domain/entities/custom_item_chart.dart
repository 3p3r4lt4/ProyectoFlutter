import 'package:equatable/equatable.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flxtech/domain/entities/circuit.dart';

class CustomItemChart extends Equatable {
  const CustomItemChart({
    required this.circuit,
    required this.item,
    required this.barColor,
  });
  final Circuit circuit;
  final double item;
  final charts.Color barColor;

  @override
  List<Object> get props => [
    circuit,
    item,
    barColor
  ];
}