import 'dart:convert';

import 'package:flxtech/domain/entities/package.dart';

Package packageFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel extends Package{
    const PackageModel({
      required this.minutes,
      required this.offerName,
      required this.sellCost,
    }): super(
      minutes: minutes,
      offerName: offerName,
      sellCost: sellCost
    );

    final int minutes;
    final String offerName;
    final double sellCost;


    factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        minutes: json["minutes"],
        offerName: json["offer_name"],
        sellCost: json["sellcost"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "minutes": minutes,
        "offer_name": offerName,
        "sellcost": sellCost,
    };
}
