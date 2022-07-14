import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';

import '../../../core/model/base_entity.dart';

abstract class ReviewRemoteSource{

  Future<BaseEntity<List<ReviewEntity>>> getReviewMovie(int movieId, FormList form);
}