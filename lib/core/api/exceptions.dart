import 'package:tatware/core/api/error_message_model.dart';

class ServiceException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServiceException({required this.errorMessageModel});
}