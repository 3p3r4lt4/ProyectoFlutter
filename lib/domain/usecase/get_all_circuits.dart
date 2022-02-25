import 'package:dartz/dartz.dart';

import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/domain/repositories/circuit_repository.dart';

class GetCircuitsAll {
  const GetCircuitsAll({required this.circuitRepository});
  final CircuitRepository circuitRepository;
  Future<Either<ClientError, Map<String, Circuit>>> call(BeanGeneric beanGeneric) async 
    =>  await circuitRepository.getAllCircuits(beanGeneric);
}