import 'package:get/get.dart';
import 'package:pop_movie_app/app/data/remote/movie/movie_remote_source.dart';
import 'package:pop_movie_app/app/data/remote/movie/movie_remote_source_impl.dart';
import 'package:pop_movie_app/app/data/remote/review/review_remote_source.dart';
import 'package:pop_movie_app/app/data/remote/review/review_remote_source_impl.dart';
import 'package:pop_movie_app/app/data/remote/trailer/trailer_remote_source.dart';
import 'package:pop_movie_app/app/data/remote/trailer/trailer_remote_source_impl.dart';


class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<MovieRemoteSource>(() => MovieRemoteSourceImpl(),
    tag: (MovieRemoteSource).toString(), fenix: true);

    Get.lazyPut<ReviewRemoteSource>(() => ReviewRemoteSourceImpl(),
    tag: (ReviewRemoteSource).toString(), fenix: true);

    Get.lazyPut<TrailerRemoteSource>(() => TrailerRemoteSourceImpl(),
    tag: (TrailerRemoteSource).toString(), fenix: true);
  }
}
