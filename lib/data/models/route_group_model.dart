import 'dart:convert';

import 'package:flxtech/domain/entities/route_group.dart';

RouteGroup routeGroupFromJson(String str) => RouteGroupModel.fromJson(json.decode(str));
String routeGroupToJson(RouteGroupModel data) => json.encode(data.toJson());

class RouteGroupModel extends RouteGroup{
  RouteGroupModel({
    required this.minutes,
    required this.name,
    required this.sellCost,
  }): super(
    minutes: minutes,
    name: name,
    sellCost: sellCost
  );

  final int minutes;
  final String name;
  final int sellCost;

  factory RouteGroupModel.fromJson(Map<String, dynamic> json) => RouteGroupModel(
      minutes: json["minutes"],
      name: json["name"],
      sellCost: json["sellcost"],
  );

  Map<String, dynamic> toJson() => {
      "minutes": minutes,
      "name": name,
      "sellcost": sellCost,
  };
}
