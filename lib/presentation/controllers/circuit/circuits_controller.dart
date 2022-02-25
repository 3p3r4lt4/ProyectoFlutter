import 'package:flutter/material.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/domain/usecase/get_all_circuits.dart';

class CircuitController extends ChangeNotifier {
  CircuitController({
    required GetCircuitsAll getCircuitsAll,
  }): _getCircuitsAll = getCircuitsAll;

  final GetCircuitsAll _getCircuitsAll;


  Map<String, Circuit> fetchCircuits = Map<String, Circuit>();
  String errorMessage = '';
  bool isLoading = false;
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
        fetchCircuits = circuitsResponse;
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }


}