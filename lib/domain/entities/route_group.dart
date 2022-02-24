import 'package:equatable/equatable.dart';

class RouteGroup extends Equatable{
  RouteGroup({
    required this.minutes,
    required this.name,
    required this.sellCost,
  });

  final int minutes;
  final String name;
  final int sellCost;

  @override
  List<Object> get props => [
    minutes,
    name,
    sellCost
  ];
}
