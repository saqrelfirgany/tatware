import 'package:tatware/experts/domain/entities/expert.dart';

class ExpertModel extends Expert {
  ExpertModel({
    required int id,
    required String originalTitle,
    required String overview,
    required String backdropPath,
    required double voteAverage,
    required bool favorite,
  }) : super(
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          backdropPath: backdropPath,
          voteAverage: voteAverage,
          favorite: favorite,
        );

  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      id: json['id'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'].toDouble(),
      favorite: false,
    );
  }
}
