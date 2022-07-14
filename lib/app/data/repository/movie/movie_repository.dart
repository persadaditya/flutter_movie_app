import '../../../core/model/base_entity.dart';
import '../../model/form/form_list.dart';
import '../../model/form/form_search.dart';
import '../../model/response/movie_entity.dart';

abstract class MovieRepository{
  Future<BaseEntity<List<MovieEntity>>> getPopularMovie(FormList form);
  Future<BaseEntity<List<MovieEntity>>> getTopRatedMovie(FormList form);
  Future<BaseEntity<List<MovieEntity>>> getUpcomingMovie(FormList form);
  Future<BaseEntity<List<MovieEntity>>> getNowPlayingMovie(FormList form);

  Future<BaseEntity<List<MovieEntity>>> searchMovie(FormSearch form);

  Future<MovieEntity> getMovieById(int id, FormList form);

}