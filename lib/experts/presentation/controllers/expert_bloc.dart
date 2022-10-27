import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tatware/core/utils/enums.dart';
import 'package:tatware/experts/domain/usecases/get_recommended_experts_use_case.dart';
import 'package:tatware/experts/presentation/controllers/expert_event.dart';
import 'package:tatware/experts/presentation/controllers/expert_state.dart';

class ExpertBloc extends Bloc<ExpertEvent, ExpertState> {
  final GetRecommendedExpertsUseCase getRecommendedExpertsUseCase;

  ExpertBloc({required this.getRecommendedExpertsUseCase}) : super(const ExpertState()) {
    on<GetRecommendedExpertEvent>((event, emit) async {
      final result = await getRecommendedExpertsUseCase.execute();
      emit(const ExpertState(recommendedExpertState: RequestStates.loaded));
      result.fold(
        (l) => emit(
          ExpertState(
            recommendedExpertState: RequestStates.error,
            message: l.errorMessageModel.statusMassage.toString(),
          ),
        ),
        (r) => emit(
          ExpertState(
            recommendedExpertState: RequestStates.loaded,
            recommendedExpert: r,
          ),
        ),
      );
    });
  }
}
