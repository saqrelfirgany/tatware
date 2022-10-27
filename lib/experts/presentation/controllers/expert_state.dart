import 'package:equatable/equatable.dart';
import 'package:tatware/core/utils/enums.dart';
import 'package:tatware/experts/domain/entities/expert.dart';

class ExpertState extends Equatable {
  final List<Expert> recommendedExpert;
  final RequestStates recommendedExpertState;
  final String message;

  const ExpertState({
    this.recommendedExpert = const [],
    this.recommendedExpertState = RequestStates.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [
        recommendedExpert,
        recommendedExpertState,
        message,
      ];
}
