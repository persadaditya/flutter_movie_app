import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';

abstract class ReviewRepository{

  Future<BaseEntity<List<ReviewEntity>>> getReview(int movieId, FormList form);
}