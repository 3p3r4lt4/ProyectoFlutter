import 'package:dartz/dartz.dart';

import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/call.dart';
import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/domain/repositories/circuit_repository.dart';
import 'package:flxtech/domain/entities/response/all_circuits_response.dart';
import 'package:flxtech/data/datasource/remote/clients_remote_datasource.dart';

class ClientRepositoryImpl implements ClientRepository {
  const ClientRepositoryImpl({
    required this.remoteDataSource,
  });
  final ClientsRemoteDataSource remoteDataSource;
  @override
  Future<Either<ClientError, Map<String, Circuit>>> getAllCircuits(BeanGeneric beanGeneric) async {
    return await remoteDataSource.getAllClientsFromDate(beanGeneric)
      .then<Either<ClientError, Map<String, Circuit>>>((AllCircuitsResponse allCircuitsResponse) {
        if (allCircuitsResponse.circuits != null) return Right(allCircuitsResponse.circuits!);
        return Left(allCircuitsResponse.error!);
      }).catchError((error) {
        print(error);
      });
  }

  @override
  Future<Either<ClientError, Map<String, Call>>> getCircuitCalls(BeanGeneric bean) {
    // TODO: implement getCircuitCalls
    throw UnimplementedError();
  }

}