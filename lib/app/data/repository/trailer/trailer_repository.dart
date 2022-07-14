import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/response/trailer_entity.dart';

abstract class TrailerRepository {

  Future<BaseEntity<List<TrailerEntity>>> getTrailerByMovieId(int id);
}