import 'package:equatable/equatable.dart';

class RouteGroup extends Equatable{
  RouteGroup({
    required this.minutes,
    required this.name,
    required this.sellCost,
  });

  final double minutes;
  final String name;
  final double sellCost;

  @override
  List<Object> get props => [
    minutes,
    name,
    sellCost
  ];
}
