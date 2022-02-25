import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/data/models/circuit_model.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/request_functions.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/data/models/response/all_circuits_response_model.dart';

abstract class ClientsRemoteDataSource {

  Future<AllCircuitsResponseModel> getAllClientsFromDate(BeanGeneric geanGeneric);

}

class ClientsRemoteDataSourceImpl implements ClientsRemoteDataSource {

  ClientsRemoteDataSourceImpl();

  @override
  Future<AllCircuitsResponseModel> getAllClientsFromDate(BeanGeneric beanGeneric) async {

  return await getFunction(
      '$URI_BASE/report/outbound/calldetail/json?year=${beanGeneric.year}&month=${beanGeneric.month}&circuitcode=${beanGeneric.circuitCode ?? ''}',
      {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Accept': '*/*'
      }

    ).then<AllCircuitsResponseModel>((http.Response response) async {
        Map<String, Circuit> _fetchedCircuit = Map<String, Circuit>();
        final Map<String, dynamic> responseJson =
              json.decode(utf8.decode(response.bodyBytes));

        if (response.statusCode != 200 && response.statusCode != 201) 
            return AllCircuitsResponseModel(circuits: null, error: parseStringToClientError('unknown'));
        if (responseJson['data'] != null) {
          final circuitsListData = responseJson['data'];
          circuitsListData.forEach((dynamic circuitData) {
            print('circuitData');
            print(circuitData.runtimeType);
            Circuit circuit = circuitFromJson(circuitData);
            _fetchedCircuit[circuit.circuitCode] = circuit;
          });
          return AllCircuitsResponseModel(circuits: _fetchedCircuit, error: null);
        
        } else {
          print(json.decode(utf8.decode(response.bodyBytes)));
          return AllCircuitsResponseModel(circuits: null, error: parseStringToClientError('unknown'));
        }

    }).catchError((error) {
      print('error fetchProducts');
      print(error.toString());
      });
    }


}

