import 'package:equatable/equatable.dart';
import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/domain/entities/circuit.dart';

abstract class AllCircuitsResponse extends Equatable {
  const AllCircuitsResponse({
    required this.circuits,
    required this.error
  });
  final Map<String, Circuit>? circuits;
  final ClientError? error;

  @override
  List<Object?> get props => [
    circuits,
    error,
  ];
}