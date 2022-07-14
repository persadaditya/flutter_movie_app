import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/base/base_controller.dart';
import 'package:pop_movie_app/app/data/model/form/form_search.dart';

import '../../../core/base/paging_controller.dart';
import '../../../core/model/base_entity.dart';
import '../../../data/model/form/form_list.dart';
import '../../../data/model/response/movie_entity.dart';
import '../../../data/repository/movie/movie_repository.dart';

class SearchController extends BaseController {

  final MovieRepository _movieRepository =
  Get.find(tag: (MovieRepository).toString());

  final RxList<MovieEntity> _movieListController = RxList.empty();
  List<MovieEntity> get movieList => _movieListController.toList();

  final moviePagingController = PagingController<MovieEntity>();

  final TextEditingController textEditingController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

  void getMovieList(){

    if(!moviePagingController.canLoadNextPage()) return;

    if(textEditingController.text.isEmpty) return;

    moviePagingController.isLoadingPage = true;

    FormSearch form = FormSearch()
    ..query = textEditingController.text
      ..page = moviePagingController.pageNumber;
    Future<BaseEntity<List<MovieEntity>>> movieRepo = _movieRepository.searchMovie(form);


    callDataService(movieRepo, onSuccess: _handleMovieList);

    moviePagingController.isLoadingPage = false;
  }

  void _handleMovieList(BaseEntity<List<MovieEntity>> data){
    var movies = data.results ?? [];

    if(_isLastPage(movies.length, data.totalResults??0)){
      moviePagingController.appendLastPage(movies);
    } else {
      moviePagingController.appendPage(movies);
    }

    var movieList = [...moviePagingController.listItems];
    _movieListController(movieList);
  }

  onRefreshPage() {
    moviePagingController.initRefresh();
    getMovieList();
  }

  onLoadNextPage() {
    logger.i("On load next: page-${moviePagingController.pageNumber}");

    getMovieList();
  }


  bool _isLastPage(int newListItemCount, int totalCount) {
    return (movieList.length + newListItemCount) >= totalCount;
  }
}
