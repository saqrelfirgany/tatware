import 'package:get_it/get_it.dart';
import 'package:tatware/experts/data/datasource/expert_remote_datascoure.dart';
import 'package:tatware/experts/data/repository/expert_repostory.dart';
import 'package:tatware/experts/domain/repository/base_expert_repository.dart';
import 'package:tatware/experts/domain/usecases/get_recommended_experts_use_case.dart';
import 'package:tatware/experts/presentation/controllers/expert_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    /// DataSource
    getIt.registerLazySingleton<BaseExpertRemoteDataSource>(
      () => ExpertRemoteDataSource(),
    );

    /// Repository
    getIt.registerLazySingleton<BaseExpertRepository>(
      () => ExpertRepository(baseExpertRemoteDataSource: getIt()),
    );

    /// Use Case
    getIt.registerLazySingleton(
      () => GetRecommendedExpertsUseCase(baseExpertRepository: getIt()),
    );

    /// Expert Bloc
    getIt.registerFactory(
      () => ExpertBloc(getRecommendedExpertsUseCase: getIt()),
    );
  }
}
