// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

import 'package:flxtech/domain/entities/call.dart';

CallModel callFromJson(String str) => CallModel.fromJson(json.decode(str));

String callToJson(CallModel data) => json.encode(data.toJson());

class CallModel extends Call {
    const CallModel({
      required  this.description,
      required  this.destination,
      required  this.minutes,
      required  this.rate,
      required  this.sellCost,
      required  this.source,
      required  this.start,
    }): super(
      description: description,
      destination: destination,
      minutes: minutes,
      rate: rate,
      sellCost: sellCost,
      source: source,
      start: start
    );

  final String description;
  final int destination;
  final double minutes;
  final double rate;
  final double sellCost;
  final int source;
  final DateTime start;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        description: json["description"],
        destination: json["destination"],
        minutes: json["minutes"].toDouble(),
        rate: json["rate"].toDouble(),
        sellCost: json["sellcost"].toDouble(),
        source: json["source"],
        start: DateTime.parse(json["start"]),
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "destination": destination,
        "minutes": minutes,
        "rate": rate,
        "sellcost": sellCost,
        "source": source,
        "start": start.toUtc(),
        // "start": start.toIso8601String(),
    };
}
