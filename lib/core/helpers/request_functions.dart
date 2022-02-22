import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postFunction(
    String path, Map<String, dynamic> body, Map<String, String> headers) async {
  http.Response response = await http.post(
    Uri.parse('$path'),
    body: json.encode(body),
    headers: headers,
  );
  return response;
}

Future<http.Response> getFunction(
    String path, Map<String, String> headers) async {
  http.Response response = await http.get(
    Uri.parse('$path'),
    headers: headers,
  );
  return response;
}

Future<http.Response> putFunction(
    String path, Map<String, dynamic> body, Map<String, String> headers) async {
  http.Response response = await http.put(
    Uri.parse('$path'),
    body: json.encode(body),
    headers: headers,
  );
  return response;
}

Future<http.Response> deleteFunction(
    String path, Map<String, String> headers) async {
  http.Response response = await http.delete(
    Uri.parse('$path'),
    headers: headers,
  );
  return response;
}
