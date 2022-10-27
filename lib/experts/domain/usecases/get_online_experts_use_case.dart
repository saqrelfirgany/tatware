import 'package:dartz/dartz.dart';
import 'package:tatware/core/api/exceptions.dart';
import 'package:tatware/experts/domain/entities/expert.dart';
import 'package:tatware/experts/domain/repository/base_expert_repository.dart';

class GetOnlineExpertsUseCase {
  GetOnlineExpertsUseCase({required this.baseExpertRepository});

  final BaseExpertRepository baseExpertRepository;

  Future<Either<ServiceException, List<Expert>>>  execute() async {
    return await baseExpertRepository.getOnlineExperts();
  }
}
