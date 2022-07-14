import 'package:get/get.dart';
import 'package:pop_movie_app/app/data/local/fav_helper.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';

import '/app/core/base/base_controller.dart';

class FavoriteController extends BaseController {

  final RxList<MovieEntity> _movieController = RxList.empty();
  List<MovieEntity> get favMovie => _movieController.toList();

  final count = 0.obs;

  void increment() => count.value++;

  @override
  void onReady() {
    getFavoriteMovies();
    super.onReady();
  }

  void getFavoriteMovies()async{
    _movieController(await FavHelper().getFavMovies());
  }



}
