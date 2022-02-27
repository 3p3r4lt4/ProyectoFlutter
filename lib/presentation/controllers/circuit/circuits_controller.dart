import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/custom_item_chart.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/domain/usecase/get_all_circuits.dart';
import 'package:flxtech/presentation/pages/clients/client_detail_page.dart';

class CircuitController extends ChangeNotifier {
  CircuitController({
    required GetCircuitsAll getCircuitsAll,
  }): _getCircuitsAll = getCircuitsAll;

  final GetCircuitsAll _getCircuitsAll;

  //* Clients detail
  void handleNavToClientDetail(Circuit circuit, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ClientDetailPage(circuit);
    }));
  }

  Map<String, Circuit> fetchCircuits = Map<String, Circuit>();
  String errorMessage = '';
  int fetchCircuitsLength = 0;
  bool isLoading = false;
  List<CustomItemChart> routeGroupsTop = [];
  List<CustomItemChart> totalsMinutes = [];
  DateTime currentDate = DateTime.now();
  DateFormat _dateFormat = DateFormat('MM');

  /// * get all Clients
  Future<Null> loadAllCircuits(BuildContext context) async {
    //clean error
    errorMessage = '';
    // show loading
    isLoading = true;
    notifyListeners();
    // use the previous month
    final bool _isFirstMonthOfTheYear = currentDate.month == FIRST_MONTH_OF_THE_YEAR;
    final DateTime date = DateTime(
      _isFirstMonthOfTheYear
        ? currentDate.year - 1 
        : currentDate.year,
      _isFirstMonthOfTheYear
        ? LAST_MONTH_OF_THE_YEAR
        : currentDate.month - 1,
    );
    String stringDateMonth = _dateFormat.format(date);
    // Fetch the list
    final result = await _getCircuitsAll.call(BeanGeneric(year: date.year.toString(), month: stringDateMonth));
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
    final List<Circuit> routeGroupsTotalList = [];
    // covert map to list
    fetchCircuits.forEach((_, value) => routeGroupsTotalList.add(value));
    // sort with compare to, reverse to return max to min
    routeGroupsTotalList.sort((prev, next) => next.routeGroupTotal.compareTo(prev.routeGroupTotal));
    for (var i = 0; i < TOP_LIMIT; i++) {
      routeGroupsTop.add(CustomItemChart(
        circuit: routeGroupsTotalList[i], 
        item: routeGroupsTotalList[i].routeGroupTotal, 
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
        circuit: minutesTopTotalList[i], 
        item: minutesTopTotalList[i].routeGroupTime, 
        barColor: charts.ColorUtil.fromDartColor(purpleColor.withOpacity(i == 0 ? 1 : 1/i)),
        ),
      );
    }
    notifyListeners();
  }

}