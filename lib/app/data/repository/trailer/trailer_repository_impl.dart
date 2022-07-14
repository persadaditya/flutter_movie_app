import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/response/trailer_entity.dart';
import 'package:pop_movie_app/app/data/remote/trailer/trailer_remote_source.dart';
import 'package:pop_movie_app/app/data/repository/trailer/trailer_repository.dart';

class TrailerRepositoryImpl extends TrailerRepository{

  final TrailerRemoteSource _remoteSource = Get.find(
    tag: (TrailerRemoteSource).toString()
  );

  @override
  Future<BaseEntity<List<TrailerEntity>>> getTrailerByMovieId(int id) {
    return _remoteSource.getTrailersByMovieId(id);
  }

}