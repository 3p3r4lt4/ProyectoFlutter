import 'dart:convert';

import 'package:flxtech/data/models/package_model.dart';
import 'package:flxtech/data/models/route_group_model.dart';
import 'package:flxtech/domain/entities/circuit.dart';

Circuit circuitFromJson(String str) => CircuitModel.fromJson(json.decode(str));
String circuitToJson(CircuitModel data) => json.encode(data.toJson());

class CircuitModel extends Circuit{
    CircuitModel({
      required this.circuitCode,
      required this.circuitName,
      required this.currency,
      required this.currencySymbol,
      required this.didQuantity,
      required this.didTotal,
      required this.endDate,
      required this.organizationCode,
      required this.organizationName,
      required this.packages,
      required this.packageTime,
      required this.packageTotal,
      required this.routeGroups,
      required this.routeGroupTime,
      required this.routeGroupTotal,
      required this.startDate,
      required this.subTotal,
      required this.tax,
      required this.total,
    }): super(
      circuitCode: circuitCode,
      circuitName: circuitName,
      currency: currency,
      currencySymbol: currencySymbol,
      didQuantity: didQuantity,
      didTotal: didTotal,
      endDate: endDate,
      organizationCode: organizationCode,
      organizationName: organizationName,
      packageTime: packageTime,
      packageTotal: packageTotal,
      packages: packages,
      routeGroupTime: routeGroupTime,
      routeGroupTotal: routeGroupTotal,
      routeGroups: routeGroups,
      startDate: startDate,
      subTotal: subTotal,
      tax: tax,
      total: total
    );

    final String circuitCode;
    final String circuitName;
    final String currency;
    final String currencySymbol;
    final int didQuantity;
    final int didTotal;
    final DateTime endDate;
    final String organizationCode;
    final String organizationName;
    final List<PackageModel> packages;
    final int packageTime;
    final int packageTotal;
    final List<RouteGroupModel> routeGroups;
    final int routeGroupTime;
    final int routeGroupTotal;
    final String startDate;
    final int subTotal;
    final double tax;
    final double total;

    factory CircuitModel.fromJson(Map<String, dynamic> json) => CircuitModel(
        circuitCode: json["circuit_code"],
        circuitName: json["circuit_name"],
        currency: json["currency"],
        currencySymbol: json["currency_simbol"],
        didQuantity: json["didquantity"],
        didTotal: json["didtotal"],
        endDate: DateTime.parse(json["enddate"]),
        organizationCode: json["organization_code"],
        organizationName: json["organization_name"],
        packages: List<PackageModel>.from(json["packages"].map((x) => PackageModel.fromJson(x))),
        packageTime: json["packagetime"],
        packageTotal: json["packagetotal"],
        routeGroups: List<RouteGroupModel>.from(json["routegroups"].map((x) => RouteGroupModel.fromJson(x))),
        routeGroupTime: json["routegrouptime"],
        routeGroupTotal: json["routegrouptotal"],
        startDate: json["startdate"],
        subTotal: json["subtotal"],
        tax: json["tax"].toDouble(),
        total: json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "circuit_code": circuitCode,
        "circuit_name": circuitName,
        "currency": currency,
        "currency_simbol": currencySymbol,
        "didquantity": didQuantity,
        "didtotal": didTotal,
        "enddate": endDate.toIso8601String(),
        "organization_code": organizationCode,
        "organization_name": organizationName,
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "packagetime": packageTime,
        "packagetotal": packageTotal,
        "routegroups": List<dynamic>.from(routeGroups.map((x) => x.toJson())),
        "routegrouptime": routeGroupTime,
        "routegrouptotal": routeGroupTotal,
        "startdate": startDate,
        "subtotal": subTotal,
        "tax": tax,
        "total": total,
    };
}
