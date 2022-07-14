import 'package:pop_movie_app/app/core/base/base_remote_source.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';
import 'package:pop_movie_app/app/data/remote/review/review_remote_source.dart';

import '../../endpoint.dart';

class ReviewRemoteSourceImpl extends BaseRemoteSource
    implements ReviewRemoteSource{

  @override
  Future<BaseEntity<List<ReviewEntity>>> getReviewMovie(int movieId, FormList form) {
    var dioCall = dioClient.get(Endpoint.reviewMovie(movieId), queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}