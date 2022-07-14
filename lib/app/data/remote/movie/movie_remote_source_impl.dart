import 'package:pop_movie_app/app/core/base/base_remote_source.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/endpoint.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/form/form_search.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';
import 'package:pop_movie_app/app/data/remote/movie/movie_remote_source.dart';

class MovieRemoteSourceImpl extends BaseRemoteSource implements MovieRemoteSource{
  @override
  Future<BaseEntity<List<MovieEntity>>> getNowPlayingMovie(FormList form) {
    var dioCall = dioClient.get(Endpoint.nowPlayingMovie, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> getPopularMovie(FormList form) {
    var dioCall = dioClient.get(Endpoint.popularMovie, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> getTopRatedMovie(FormList form) {
    var dioCall = dioClient.get(Endpoint.topRatedMovie, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> getUpcomingMovie(FormList form) {
    var dioCall = dioClient.get(Endpoint.upcomingMovie, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseEntity<List<MovieEntity>>> searchMovie(FormSearch form) {
    var dioCall = dioClient.get(Endpoint.searchMovie, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieEntity> getMovieById(int id, FormList form) {
    var dioCall = dioClient.get(Endpoint.movieById(id), queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => MovieEntity.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

}