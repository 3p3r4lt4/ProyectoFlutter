import 'package:equatable/equatable.dart';

abstract class SuccessResponse extends Equatable {

  const SuccessResponse({
    required this.success,
    required this.message,
    this.response,
  });

  final bool success;
  final String message;
  final Map<String, dynamic>? response;

  @override
  List<Object?> get props => [success, message, response];

}