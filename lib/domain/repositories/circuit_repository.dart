import 'package:dartz/dartz.dart';

import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/domain/entities/call.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';

abstract class CircuitRepository {
  Future<Either<ClientError, Map<String, Circuit>>> getAllCircuits(BeanGeneric bean);

  Future<Either<ClientError, Map<String,Call>>> getCircuitCalls(BeanGeneric bean);

}