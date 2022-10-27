import 'package:dartz/dartz.dart';
import 'package:tatware/core/api/exceptions.dart';
import 'package:tatware/experts/domain/entities/expert.dart';

abstract class BaseExpertRepository {
  Future<Either<ServiceException, List<Expert>>>  getRecommendedExperts();

  Future<Either<ServiceException, List<Expert>>>  getOnlineExperts();
}
