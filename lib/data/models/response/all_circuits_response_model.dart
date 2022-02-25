import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/response/all_circuits_response.dart';

class AllCircuitsResponseModel extends AllCircuitsResponse {
  const AllCircuitsResponseModel({
    required this.circuits,
    required this.error
  }): super(
    circuits: circuits,
    error: error,
  );
  
  final Map<String, Circuit>? circuits;
  final ClientError? error;

}