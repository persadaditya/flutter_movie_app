import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/form/form_search.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';
import 'package:pop_movie_app/app/data/remote/movie/movie_remote_source.dart';
import 'package:pop_movie_app/app/data/repository/movie/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{

  final MovieRemoteSource _remoteSource =
  Get.find(tag: (MovieRemoteSource).toString());

  @override
  Future<BaseEntity<List<MovieEntity>>> getNowPlayingMovie(FormList form) {
    return _remoteSource.getNowPlayingMovie(form);
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> getPopularMovie(FormList form) {
    return _remoteSource.getPopularMovie(form);
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> getTopRatedMovie(FormList form) {
    return _remoteSource.getTopRatedMovie(form);
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> getUpcomingMovie(FormList form) {
    return _remoteSource.getUpcomingMovie(form);
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> searchMovie(FormSearch form) {
    return _remoteSource.searchMovie(form);
  }

  @override
  Future<MovieEntity> getMovieById(int id, FormList form) {
    return _remoteSource.getMovieById(id, form);
  }




}