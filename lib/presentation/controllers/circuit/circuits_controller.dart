import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/custom_item_chart.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/domain/usecase/get_all_circuits.dart';

class CircuitController extends ChangeNotifier {
  CircuitController({
    required GetCircuitsAll getCircuitsAll,
  }): _getCircuitsAll = getCircuitsAll;

  final GetCircuitsAll _getCircuitsAll;


  Map<String, Circuit> fetchCircuits = Map<String, Circuit>();
  String errorMessage = '';
  int fetchCircuitsLength = 0;
  bool isLoading = false;
  List<CustomItemChart> subTotalsTop = [];
  List<CustomItemChart> totalsMinutes = [];
  DateTime date = DateTime.now();

  /// * get all Clients
  Future<Null> loadAllCircuits(BuildContext context) async {
    //clean error
    errorMessage = '';
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await _getCircuitsAll.call(BeanGeneric(year: date.year.toString(), month: date.month.toString()));
    // Handle success or error
    result.fold(
      (e) {
        errorMessage = "fail";
        isLoading = false;
      },
      (circuitsResponse) {
        this.fetchCircuits = circuitsResponse;
        this.fetchCircuitsLength = fetchCircuits.length;
        this.isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }

  void calculateSubTotalTop() {
    final List<Circuit> circuitsTopSubTotalList = [];
    // covert map to list
    fetchCircuits.forEach((_, value) => circuitsTopSubTotalList.add(value));
    // sort with compare to, reverse to return max to min
    circuitsTopSubTotalList.sort((prev, next) => next.subTotal.compareTo(prev.subTotal));
    for (var i = 0; i < TOP_LIMIT; i++) {
      subTotalsTop.add(CustomItemChart(
        bottom: 'S/.${doubleToAsFixedDecimals(circuitsTopSubTotalList[i].subTotal)}', 
        item: circuitsTopSubTotalList[i].subTotal, 
        barColor: charts.ColorUtil.fromDartColor(purpleColor.withOpacity(i == 0 ? 1 : 1/i)),
        ),
      );
    }
    notifyListeners();
  }

  void calculateTotalMinutesTop() {
    final List<Circuit> minutesTopTotalList = [];
    // covert map to list
    fetchCircuits.forEach((_, value) => minutesTopTotalList.add(value));
    // sort with compare to, reverse to return max to min
    minutesTopTotalList.sort((prev, next) => next.routeGroupTime.compareTo(prev.routeGroupTime));
    for (var i = 0; i < TOP_LIMIT; i++) {
      totalsMinutes.add(CustomItemChart(
        bottom: '${doubleToAsFixedDecimals(minutesTopTotalList[i].routeGroupTime)}\'', 
        item: minutesTopTotalList[i].routeGroupTime, 
        barColor: charts.ColorUtil.fromDartColor(purpleColor.withOpacity(i == 0 ? 1 : 1/i)),
        ),
      );
    }
    notifyListeners();
  }

}