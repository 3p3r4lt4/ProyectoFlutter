import 'package:flxtech/domain/entities/response/success_response.dart';

class SuccessResponseModel extends SuccessResponse {

  const SuccessResponseModel({
    required this.success,
    required this.message,
    this.response,
  }): super(
    success: success,
    message: message,
    response: response
  );

  final bool success;
  final String message;
  final Map<String, dynamic>? response;

}