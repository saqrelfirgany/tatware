import 'package:dartz/dartz.dart';
import 'package:tatware/core/api/exceptions.dart';
import 'package:tatware/experts/data/datasource/expert_remote_datascoure.dart';
import 'package:tatware/experts/domain/entities/expert.dart';
import 'package:tatware/experts/domain/repository/base_expert_repository.dart';

class ExpertRepository extends BaseExpertRepository {
  final BaseExpertRemoteDataSource baseExpertRemoteDataSource;

  ExpertRepository({required this.baseExpertRemoteDataSource});

  @override
  Future<Either<ServiceException, List<Expert>>> getOnlineExperts() async {
    final response = await baseExpertRemoteDataSource.getRecommendedExperts();
    try {
      return Right(response);
    } on ServiceException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServiceException, List<Expert>>> getRecommendedExperts() async {
    final response = await baseExpertRemoteDataSource.getRecommendedExperts();
    try {
      return Right(response);
    } on ServiceException catch (e) {
      return Left(e);
    }
  }
}
