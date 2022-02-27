import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flxtech/core/errors/client_error.dart';
import 'package:flxtech/data/models/circuit_model.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/request_functions.dart';
import 'package:flxtech/domain/entities/request/bean_generic.dart';
import 'package:flxtech/data/models/response/all_circuits_response_model.dart';

abstract class CircuitsRemoteDataSource {

  Future<AllCircuitsResponseModel> getAllCircuitsFromDate(BeanGeneric geanGeneric);

}

class CircuitsRemoteDataSourceImpl implements CircuitsRemoteDataSource {

  CircuitsRemoteDataSourceImpl();

  @override
  Future<AllCircuitsResponseModel> getAllCircuitsFromDate(BeanGeneric beanGeneric) async {
    print('record all clients date: ${beanGeneric.year}${beanGeneric.month}');
  return await getFunction(
      'http://${beanGeneric.year}${beanGeneric.month}$URI_BASE_DYNAMIC/report/outbound/calldetail/json?year=${beanGeneric.year}&month=${beanGeneric.month}&circuitcode=${beanGeneric.circuitCode ?? ''}',
      {
        'Content-Type': 'application/json',
        'Charset': 'utf-8'
      }

    ).then<AllCircuitsResponseModel>((http.Response response) async {
        Map<String, Circuit> _fetchedCircuit = Map<String, Circuit>();
        final List<dynamic> responseJson =
              json.decode(utf8.decode(response.bodyBytes));

        if (response.statusCode != 200 && response.statusCode != 201) 
            return AllCircuitsResponseModel(circuits: null, error: parseStringToClientError('unknown'));
        if (responseJson.isNotEmpty) {
          responseJson.forEach((value) {
            Circuit circuit = circuitFromMap(value['summary']);
            _fetchedCircuit[circuit.circuitCode] = circuit;
          });
          return AllCircuitsResponseModel(circuits: _fetchedCircuit, error: null);
        
        } else {
          print(json.decode(utf8.decode(response.bodyBytes)));
          return AllCircuitsResponseModel(circuits: null, error: parseStringToClientError('unknown'));
        }

    }).catchError((error) async {
      print(error);
        return AllCircuitsResponseModel(circuits: null, error: parseStringToClientError('unknown'));
      });
    }


}

