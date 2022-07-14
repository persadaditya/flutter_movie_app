import 'package:pop_movie_app/app/network/dio_provider.dart';

class Endpoint{
  static var baseUrl = DioProvider.baseUrl;


  ///movie
  static var topRatedMovie = baseUrl + '/movie/top_rated';
  static var popularMovie = baseUrl + '/movie/popular';
  static var upcomingMovie = baseUrl + '/movie/upcoming';
  static var nowPlayingMovie = baseUrl + '/movie/now_playing';
  static var searchMovie = baseUrl + '/search/movie';

  static String movieById(int id) => '/movie/$id';

  static String reviewMovie(int movieId) => '/movie/$movieId/reviews';

  static String trailerMovie(int movieId) => '/movie/$movieId/videos';

}