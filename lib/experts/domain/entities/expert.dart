import 'package:equatable/equatable.dart';

class Expert extends Equatable {
  final int id;
  final String originalTitle;
  final String overview;
  final String backdropPath;
  final double voteAverage;
  bool favorite;

  Expert({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.favorite,
  });

  @override
  List<Object> get props => [
        id,
        originalTitle,
        overview,
        backdropPath,
        voteAverage,
        favorite,
      ];
}
