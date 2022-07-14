import 'package:get/get.dart';
import 'package:pop_movie_app/app/data/repository/movie/movie_repository.dart';
import 'package:pop_movie_app/app/data/repository/movie/movie_repository_impl.dart';
import 'package:pop_movie_app/app/data/repository/review/review_repository.dart';
import 'package:pop_movie_app/app/data/repository/review/review_repository_impl.dart';
import 'package:pop_movie_app/app/data/repository/trailer/trailer_repository.dart';
import 'package:pop_movie_app/app/data/repository/trailer/trailer_repository_impl.dart';


class RepositoryBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(),
    tag: (MovieRepository).toString(), fenix: true);

    Get.lazyPut<ReviewRepository>(() => ReviewRepositoryImpl(),
    tag: (ReviewRepository).toString(), fenix: true);

    Get.lazyPut<TrailerRepository>(() => TrailerRepositoryImpl(),
    tag: (TrailerRepository).toString(), fenix: true);
  }
}
