
import 'package:equatable/equatable.dart';

abstract class Call extends Equatable{
  const Call({
      required this.description,
      required this.destination,
      required this.minutes,
      required this.rate,
      required this.sellCost,
      required this.source,
      required this.start,
  });

  final String description;
  final int destination;
  final double minutes;
  final double rate;
  final double sellCost;
  final int source;
  final DateTime start;

  @override
  List<Object> get props => [
    description,
    destination,
    minutes,
    rate,
    sellCost,
    source,
    start,
  ];

}
