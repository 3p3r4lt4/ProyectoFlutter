import 'package:equatable/equatable.dart';

class BeanGeneric extends Equatable {
  
  const BeanGeneric({this.circuitCode, required this.year, required this.month});

  final String? circuitCode;
  final String year;
  final String month;

  @override
  List<Object?> get props => [circuitCode, year, month];

}