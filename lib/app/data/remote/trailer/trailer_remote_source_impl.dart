import 'package:pop_movie_app/app/core/base/base_remote_source.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/trailer_entity.dart';
import 'package:pop_movie_app/app/data/remote/trailer/trailer_remote_source.dart';

import '../../endpoint.dart';

class TrailerRemoteSourceImpl extends BaseRemoteSource implements TrailerRemoteSource{
  @override
  Future<BaseEntity<List<TrailerEntity>>> getTrailersByMovieId(int id) {
    FormList form = FormList();

    var dioCall = dioClient.get(Endpoint.trailerMovie(id), queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}