import 'package:equatable/equatable.dart';

import 'package:flxtech/data/models/package_model.dart';
import 'package:flxtech/data/models/route_group_model.dart';

class Circuit extends Equatable{
    Circuit({
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
    });

    final int circuitCode;
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

  @override
  List<Object?> get props => [
    circuitCode,
    circuitName,
    currency,
    currencySymbol,
    didQuantity,
    didTotal,
    endDate,
    organizationCode,
    organizationName,
    packageTime,
    packageTotal,
    packages,
    routeGroupTime,
    routeGroupTotal,
    routeGroups,
    startDate,
    subTotal,
    tax,
    total
  ];

}
