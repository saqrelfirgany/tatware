class AppConstants {
  static const apiKey = '0770ab0bd414e1c46239e588d2007d72';
  static const baseUrl = 'https://api.themoviedb.org/3';

  /// Expert End Points
  static const recommendedExpertEndPoint = '$baseUrl/movie/now_playing?api_key=$apiKey';

  /// Image End Points
  static const imageEndPoint = 'https://image.tmdb.org/t/p/w500';
}
