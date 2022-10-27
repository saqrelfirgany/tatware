import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMassage;
  final bool isSuccess;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMassage,
    required this.isSuccess,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      statusMassage: json['status_message'],
      isSuccess: json['success'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, statusMassage, isSuccess];
}
