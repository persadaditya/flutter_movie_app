import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pop_movie_app/app/data/local/preference/preference_manager.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';
import 'package:pop_movie_app/flavors/build_config.dart';

class FavHelper{

  final PreferenceManager _preference = Get.find(tag: (PreferenceManager).toString());
  final Logger logger = BuildConfig.instance.config.logger;

  static List<MovieEntity> favMovies = [];

  Future<void> saveMovies(MovieEntity data) async{
    var movies = await getFavMovies();

    movies.add(data);
    logger.d('aap-fav: add -> ${jsonEncode(movies)}');
    _preference.setString(PreferenceManager.keyFavorite, jsonEncode(movies));
  }

  Future<void> deleteMovies(MovieEntity data) async{
    var movies = await getFavMovies();

    movies.removeWhere((movie) => movie.id == data.id);
    logger.d('aap-fav: remove -> ${jsonEncode(movies)}');
    _preference.setString(PreferenceManager.keyFavorite, jsonEncode(movies));
  }

  Future<List<MovieEntity>> getFavMovies()async{
    List<MovieEntity> movies = <MovieEntity>[];

    String moviesData = await _preference.getString(PreferenceManager.keyFavorite);
    logger.d('aap-fav: load -> $moviesData');

    if(moviesData.isEmpty){
      return movies;
    }

    List<dynamic> parsedListJson = jsonDecode(moviesData);
    movies = List<MovieEntity>.from(parsedListJson.map((e) => MovieEntity.fromJson(e)));
    favMovies = movies;

    return movies;
  }

  Future<bool> hasFavoriteMovie(int id) async{

    await getFavMovies();

    for (var movie in favMovies) {
      logger.d('aap-fav: $id - ${movie.id}');

      if(movie.id==id){
        return true;
      }
    }

    return false;
  }

  void clearAllFavorite(){
    _preference.setString(PreferenceManager.keyFavorite, '');
  }


}