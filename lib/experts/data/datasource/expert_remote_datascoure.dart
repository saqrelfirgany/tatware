import 'package:tatware/core/api/dio_helper.dart';
import 'package:tatware/core/api/error_message_model.dart';
import 'package:tatware/core/api/exceptions.dart';
import 'package:tatware/core/utils/app_constants.dart';
import 'package:tatware/experts/data/models/expert_model.dart';

abstract class BaseExpertRemoteDataSource {
  Future<List<ExpertModel>> getRecommendedExperts();
}

class ExpertRemoteDataSource extends BaseExpertRemoteDataSource {
  @override
  Future<List<ExpertModel>> getRecommendedExperts() async {
    dynamic response = await DioHelper.get(url: AppConstants.recommendedExpertEndPoint);
    if (response != false) {
      return List<ExpertModel>.from((response['results'] as List).map((e) => ExpertModel.fromJson(e)));
    } else {
      throw ServiceException(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }
}
