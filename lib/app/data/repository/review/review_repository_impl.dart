import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';
import 'package:pop_movie_app/app/data/remote/review/review_remote_source.dart';
import 'package:pop_movie_app/app/data/repository/review/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository{

  final ReviewRemoteSource _remoteSource =
  Get.find(tag: (ReviewRemoteSource).toString());

  @override
  Future<BaseEntity<List<ReviewEntity>>> getReview(int movieId, FormList form) {
    return _remoteSource.getReviewMovie(movieId, form);
  }

}