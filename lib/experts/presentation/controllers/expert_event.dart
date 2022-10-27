import 'package:equatable/equatable.dart';

abstract class ExpertEvent extends Equatable {
  const ExpertEvent();

  @override
  List<Object> get props => [];
}

class GetRecommendedExpertEvent extends ExpertEvent {}

class GetOnlineExpertEvent extends ExpertEvent {}
